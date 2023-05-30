import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/topic_model.dart';

class SelectDataTopic extends StatefulWidget {
  final Function(TopicModel)? onChanged; // Função de callback

  const SelectDataTopic({Key? key, this.onChanged}) : super(key: key);

  @override
  SelectDataTopicState createState() => SelectDataTopicState();
}

class SelectDataTopicState extends State<SelectDataTopic> {
  int _selectedTopicId = 0;

  @override
  Widget build(BuildContext context) {
    final topicProvider = Provider.of<TopicProvider>(context);
    final topics = topicProvider.topics;

    return Center(
      child: DropdownButton<int>(
        value: _selectedTopicId,
        onChanged: (value) {
          setState(() {
            _selectedTopicId = value!;
            final selectedTopic =
                topics.firstWhere((topic) => topic.id == value);
            widget.onChanged?.call(
                selectedTopic); // Chama a função de callback passando o tópico selecionado
          });
        },
        items: topics.map((topic) {
          return DropdownMenuItem<int>(
            value: topic.id,
            child: Text(topic.title),
          );
        }).toList(),
      ),
    );
  }
}
