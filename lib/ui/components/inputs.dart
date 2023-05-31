import 'package:flutter/material.dart';

enum InputType {
  text,
  email,
  password,
  numeric,
}

class Input extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final InputType inputType;

  const Input({
    Key? key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    required this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildInputWidget();
  }

  Widget _buildInputWidget() {
    switch (inputType) {
      case InputType.email:
        return _buildEmailInput();
      case InputType.password:
        return _buildPasswordInput();
      case InputType.numeric:
        return _buildNumericInput();
      default:
        return _buildTextInput();
    }
  }

  Widget _buildTextInput() {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }

  Widget _buildEmailInput() {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: label,
          hintText: 'meu_melhor_email@gmail.com',
          prefixIconColor: Colors.blueGrey,
          prefixIcon: const Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.email),
          )),
      onSaved: (value) {
        print('VALUE $value');
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an email';
        }
        if (!_isValidEmail(value)) {
          return 'Please enter a valid email';
        }
        return null; // Return null to indicate the input is valid
      },
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildPasswordInput() {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }

  Widget _buildNumericInput() {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }

  bool _isValidEmail(String value) {
    // Use a regular expression to validate email format
    final emailRegExp = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegExp.hasMatch(value);
  }
}
