import 'package:flutter/material.dart';

import 'package:anotes/philanthropy/models/topic_model.dart';
import 'package:anotes/philanthropy/screens/topic_screen.dart';
import 'package:anotes/philanthropy/data/database.dart';

import '../screens/philanthropy_screen.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TopicModel>>(
      future: _fetchTopicsFromDatabase(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final topics = snapshot.data;

          return Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(context),
                Expanded(
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
                ),
              ],
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

  Future<List<TopicModel>> _fetchTopicsFromDatabase() async {
    final database = await DatabaseProvider.instance.open();
    final List<Map<String, dynamic>> topicMaps =
        await database.query(DatabaseProvider.topicTable);
    await database.close();

    return topicMaps.map((map) => TopicModel.fromMap(map)).toList();
  }

  void _navigateToTopicScreen(BuildContext context, TopicModel topic) {
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
        cursor: SystemMouseCursors.click,
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
                margin: EdgeInsets.only(bottom: 8.0),
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
                    SizedBox(
                      height: 24,
                      child: Text(
                        'Educação e Trabalho',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
