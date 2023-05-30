import 'package:flutter/material.dart';
import 'package:anotes/philanthropy/widgets/sidebar.dart';
import 'package:provider/provider.dart';

import '../models/topic_model.dart';
import '../widgets/add_data_form.dart';
import '../widgets/show_data_topic.dart';

class PhilanthropyScreen extends StatelessWidget {
  const PhilanthropyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACEPROF - Fazer o bem!'),
      ),
      drawer: const Sidebar(),
      body: Center(
          child: ListView(
        children: const [
          AddDataForm(), // Add the AddDataForm widget

          ShowDataTopics(), // Add the ShowDataTopics widget
        ],
      )),
    );
  }
}
