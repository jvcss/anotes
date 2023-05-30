import 'package:anotes/philanthropy/widgets/select_data_topic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/topic_model.dart';
import 'collapsible_card.dart';
//import 'dynamic_label_form_field.dart';

class UpdateDataTopic extends StatefulWidget {
  const UpdateDataTopic({Key? key}) : super(key: key);

  @override
  UpdateDataTopicState createState() => UpdateDataTopicState();
}

class UpdateDataTopicState extends State<UpdateDataTopic> {
  late TopicModel _selectedTopic;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _responsibleController = TextEditingController();
  final TextEditingController _assignmentsController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _responsibleController.dispose();
    _assignmentsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topicProvider = Provider.of<TopicProvider>(context);

    return CollapsibleCard(
      title: 'Atualizar Tópico',
      content: Column(
        children: [
          SelectDataTopic(
            onChanged: (selectedTopic) {
              setState(() {
                _selectedTopic = selectedTopic;
                _titleController.text = selectedTopic.title;
                _descriptionController.text = selectedTopic.description;
                _responsibleController.text = selectedTopic.responsible;
                _assignmentsController.text = selectedTopic.assignments;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Título',
                  ),
                ),
                const SizedBox(height: 16),
                /*DynamicLabelFormField(
                  defaultLabelText: 'Description',
                  selectedLabelText: _descriptionController.text != ''
                      ? _selectedTopic.description
                      : _descriptionController.text,
                  controller: _descriptionController,
                ),*/
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Descrição',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _responsibleController,
                  decoration: const InputDecoration(
                    labelText: 'Atividades',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _assignmentsController,
                  decoration: const InputDecoration(
                    labelText: 'Responsáveis',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Update the selected topic with new values
                    final updatedTopic = TopicModel(
                      id: _selectedTopic.id,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      responsible: _responsibleController.text,
                      assignments: _assignmentsController.text,
                    );

                    // Perform database operation (e.g., update data)
                    topicProvider.updateTopic(updatedTopic);

                    // Clear form fields
                    _titleController.clear();
                    _descriptionController.clear();
                    _responsibleController.clear();
                    _assignmentsController.clear();
                  },
                  child: const Text('Inserir'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
