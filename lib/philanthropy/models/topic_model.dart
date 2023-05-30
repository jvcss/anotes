import 'package:flutter/material.dart';
import '../data/database.dart';

class TopicModel {
  final int id;
  final String title;
  final String description;
  final String responsible;
  final String assignments;

  TopicModel({
    required this.id,
    required this.title,
    required this.description,
    required this.responsible,
    required this.assignments,
  });

  factory TopicModel.fromMap(Map<String, dynamic> map) {
    return TopicModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      responsible: map['responsible'],
      assignments: map['assignments'],
    );
  }

  Map<String, Object> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'responsible': responsible,
      'assignments': assignments,
    };
  }
}

class TopicProvider extends ChangeNotifier {
  List<TopicModel> _topics = [];

  List<TopicModel> get topics => _topics;

  Future<void> selectTopics() async {
    final dataList = await DatabaseProvider.instance.selectTopic();
    _topics = dataList
        .map((item) => TopicModel(
              id: item['id'],
              title: item['title'],
              description: item['description'],
              responsible: item['responsible'],
              assignments: item['assignments'],
            ))
        .toList();
    notifyListeners();
  }

  Future<void> insertTopic(TopicModel topic) async {
    await DatabaseProvider.instance.insertTopic(topic.toMap());
    _topics.add(topic);
    notifyListeners();
  }

  Future<void> updateTopic(TopicModel topic) async {
    await DatabaseProvider.instance.updateTopic(topic.id, topic.toMap());
    final index = _topics.indexWhere((t) => t.id == topic.id);
    if (index != -1) {
      _topics[index] = topic;
      notifyListeners();
    }
  }

  Future<void> deleteTopic(int id) async {
    await DatabaseProvider.instance.deleteTopicById(id);
    _topics.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  Future<void> loadTopics() async {
    final dataList = await DatabaseProvider.instance.selectAllTopics('id ASC');
    _topics.clear();
    _topics.addAll(dataList.map((map) => TopicModel.fromMap(map)));
    notifyListeners();
  }
}
