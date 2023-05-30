import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/topic_model.dart';
import 'collapsible_card.dart';

class ShowDataTopics extends StatelessWidget {
  const ShowDataTopics({super.key});

  @override
  Widget build(BuildContext context) {
    //final topicProvider = Provider.of<TopicProvider>(context);
    //final topics = topicProvider.topics;

    return CollapsibleCard(
      title: 'Data Topics',
      content: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Consumer<TopicProvider>(builder: (context, topicProvider, _) {
          return FutureProvider<void>(
            initialData: null,
            create: (_) => topicProvider.selectTopics(),
            child: Consumer<TopicProvider>(
                //create a builder to fetch all the data
                builder: (context, topicProvider, _) {
              final topics = topicProvider.topics;

              return DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Ramo')),
                  DataColumn(label: Text('Descrição')),
                  DataColumn(label: Text('Atividades')),
                  DataColumn(label: Text('Responsáveis')),
                ],
                rows: topics.map((topic) {
                  // ignore: avoid_print
                  print("topic.title !!!!!!!!!!!!");
                  // ignore: avoid_print
                  print(topic.title);
                  return DataRow(
                    cells: [
                      DataCell(Text(topic.id.toString())),
                      DataCell(Text(topic.title)),
                      DataCell(Text(topic.description)),
                      DataCell(Text(topic.responsible)),
                      DataCell(Text(topic.assignments)),
                    ],
                  );
                }).toList(),
              );
            }),
          );
        }),
      ),
    );
  }
}
