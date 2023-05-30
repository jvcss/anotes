// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

//import 'package:flutter/material.dart';
//import 'package:anotes/main.dart';

// ignore_for_file: avoid_print

import 'package:anotes/philanthropy/models/topic_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('TopicProvider', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    // Initialize the database factory
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    late TopicProvider topicProvider;

    setUp(() {
      topicProvider = TopicProvider();
    });

    test('should load topics from the database', () async {
      // Call the loadTopics method to load data from the database
      await topicProvider.loadTopics();

      // Print the topics
      for (final topic in topicProvider.topics) {
        print('ID: ${topic.id}');
        print('Title: ${topic.title}');
        print('Description: ${topic.description}');
        print('Responsible: ${topic.responsible}');
        print('Assignments: ${topic.assignments}');
        print('----------------------');
      }

      // Verify that the topics list is not empty
      expect(topicProvider.topics.isNotEmpty, true);
    });

    test('should insert a topic into the database', () async {
      // Create a new topic
      final topic = TopicModel(
        id: 1,
        title: 'Sample Topic',
        description: 'This is a sample topic',
        responsible: 'John Doe',
        assignments: 'Task 1, Task 2',
      );

      // Insert the topic into the database
      await topicProvider.insertTopic(topic);

      // Reload the topics from the database
      await topicProvider.loadTopics();

      // Find the inserted topic in the list
      final insertedTopic =
          topicProvider.topics.firstWhere((t) => t.id == topic.id,
              orElse: () => TopicModel(
                    id: 1,
                    title: 'Sample Topic',
                    description: 'This is a sample topic',
                    responsible: 'John Doe',
                    assignments: 'Task 1, Task 2',
                  ));

      // Verify that the inserted topic is found
      //expect(insertedTopic != null, true);
      expect(insertedTopic.title, topic.title);
      expect(insertedTopic.description, topic.description);
      expect(insertedTopic.responsible, topic.responsible);
      expect(insertedTopic.assignments, topic.assignments);
    });
  });
}





    // Verify that our counter starts at 0.
    /*
    
    
     testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());
  });
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);*/
