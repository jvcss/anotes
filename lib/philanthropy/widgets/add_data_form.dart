import 'package:flutter/material.dart';

import 'collapsible_card.dart';

class AddDataForm extends StatelessWidget {
  const AddDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsibleCard(
      title: 'Adicionar Áreas Responsáveis',
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Área do Conhecimento',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Descrição',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Responsabilidades',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Gerentes',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
