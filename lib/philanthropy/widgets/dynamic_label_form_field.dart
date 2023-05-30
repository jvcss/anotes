import 'package:flutter/material.dart';
//import '../models/topic_model.dart';

class DynamicLabelFormField extends StatelessWidget {
  final String defaultLabelText;
  final String selectedLabelText;
  final TextEditingController controller;

  const DynamicLabelFormField({
    super.key,
    required this.defaultLabelText,
    required this.selectedLabelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    //print('selectedLabelText > $selectedLabelText');
    final String labelText =
        selectedLabelText == '' ? defaultLabelText : selectedLabelText;

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
