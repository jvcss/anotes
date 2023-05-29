import 'package:flutter/material.dart';
import 'package:anotes/philanthropy/models/topic_model.dart';

class TopicScreen extends StatelessWidget {
  final Topic topic;

  const TopicScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Descrição:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(topic.description),
            const SizedBox(height: 16.0),
            const Text(
              'Responsável:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(topic.responsible),
            const SizedBox(height: 16.0),
            const Text(
              'Atribuições:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(topic.assignments),
          ],
        ),
      ),
    );
  }
}
