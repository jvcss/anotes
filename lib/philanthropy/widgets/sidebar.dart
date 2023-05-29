import 'package:flutter/material.dart';

import 'package:anotes/philanthropy/models/topic_model.dart';
import 'package:anotes/philanthropy/screens/topic_screen.dart';
import 'package:anotes/philanthropy/data/database.dart';

import '../screens/philanthropy_screen.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: _fetchTopicsFromDatabase(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final topics = snapshot.data;

          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: ListTile.divideTiles(
                context: context,
                tiles: topics!.map((topic) {
                  return ListTile(
                    title: Text(topic.title),
                    onTap: () {
                      _navigateToTopicScreen(context, topic);
                    },
                  );
                }),
              ).toList(),
            ),
          );
        }

        return Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            _buildHeader(context),
          ]),
        );
      },
    );
  }

  Future<List<Topic>> _fetchTopicsFromDatabase() async {
    final database = await DatabaseProvider.instance.open();
    final List<Map<String, dynamic>> topicMaps = await database.query('topics');
    await DatabaseProvider.instance.close(database);

    return topicMaps.map((map) => Topic.fromMap(map)).toList();
  }

  void _navigateToTopicScreen(BuildContext context, Topic topic) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TopicScreen(topic: topic),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click, // Set the cursor to a hand cursor
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PhilanthropyScreen()),
              );
            },
            child: const SizedBox(
              height: 120,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ACEPROF',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Educação e Trabalho',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
