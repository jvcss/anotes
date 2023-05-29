import 'package:flutter/material.dart';
import 'package:anotes/philanthropy/widgets/sidebar.dart';

import '../widgets/collapsible_card.dart';

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
        children: [
          CollapsibleCard(
            title: 'Card Title',
            content: Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text('Card Content'),
            ),
          ),
        ],
      )),
    );
  }
}
