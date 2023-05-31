import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  final Function(Map<String, String>) onSubmit;
  final List<Widget> children;

  const Forms({
    Key? key,
    required this.onSubmit,
    required this.children,
  }) : super(key: key);

  static FormsState? of(BuildContext context) {
    return context.findAncestorStateOfType<FormsState>();
  }

  @override
  FormsState createState() => FormsState();
}

class FormsState extends State<Forms> {
  final _formKey = GlobalKey<FormState>();
  final _formValues = <String, String>{};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ...widget.children,
        ],
      ),
    );
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(_formValues);
    }
  }

  void updateFormValue(String field, String value) {
    setState(() {
      _formValues[field] = value;
    });
  }
}
