import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/topic_model.dart';

class SelectDataTopic extends StatelessWidget {
  final Function(TopicModel)? onChanged; // Callback function

  const SelectDataTopic({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<TopicProvider>(
        builder: (context, topicProvider, _) {
          topicProvider.selectTopics(); // Fetch the topics

          final topics = topicProvider.topics;

          int selectedTopicId = 0;

          return DropdownButton<int>(
            value: selectedTopicId,
            onChanged: (value) {
              selectedTopicId = value!;
              final selectedTopic =
                  topics.firstWhere((topic) => topic.id == value);
              onChanged?.call(selectedTopic); // Callback
            },
            items: topics.map((topic) {
              return DropdownMenuItem<int>(
                value: topic.id,
                child: Text(topic.title),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
