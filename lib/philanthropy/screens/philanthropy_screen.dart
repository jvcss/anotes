import 'package:flutter/material.dart';
import 'package:anotes/philanthropy/widgets/sidebar.dart';

import '../widgets/add_data_form.dart';

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
        ],
      )),
    );
  }
}
