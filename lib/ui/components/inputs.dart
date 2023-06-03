import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputType {
  text,
  email,
  password,
  numeric,
}

class Input extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final InputType inputType;
  final bool acceptsFloat;
  final bool multiline;

  const Input({
    Key? key,
    required this.label,
    required this.controller,
    required this.inputType,
    this.acceptsFloat = false,
    this.multiline = false,
  }) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return _buildInputWidget();
  }

  Widget _buildInputWidget() {
    switch (widget.inputType) {
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
      controller: widget.controller,
      obscureText: false,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIconColor: Colors.blueGrey,
        prefixIcon: const Icon(Icons.text_fields),
      ),
      maxLines: widget.multiline
          ? null
          : 1, // Set maxLines based on the multiline parameter
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  Widget _buildEmailInput() {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: widget.label,
          hintText: 'my_best_email@gmail.com',
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
        if (value!.isEmpty) {
          return 'Please enter your email';
        }
        if (!EmailValidator.validate(value)) {
          return 'Please enter a valid email address';
        }
        if (!isAllowedEmailProvider(value)) {
          return 'Please use a supported email provider (e.g., Google, Hotmail, Yahoo)';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildPasswordInput() {
    return TextFormField(
      controller: widget.controller,
      obscureText: !isPasswordVisible,
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIconColor: Colors.blueGrey,
        suffixIconColor: Colors.blueGrey,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          child: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }

        var missingCriteria = <String>[];
        missingCriteria = _isAllowedPassword(value);
        if (missingCriteria.isNotEmpty) {
          return 'Password must have ${missingCriteria.join(', ')}';
        }

        return null;
      },
    );
  }

  Widget _buildNumericInput() {
    TextInputType keyboardType;
    List<TextInputFormatter> inputFormatters;
    if (widget.acceptsFloat) {
      keyboardType = const TextInputType.numberWithOptions(decimal: true);
      inputFormatters = [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))
      ];
    } else {
      keyboardType = TextInputType.number;
      inputFormatters = [FilteringTextInputFormatter.digitsOnly];
    }

    return TextFormField(
      controller: widget.controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: const Icon(Icons.dialpad),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a number';
        }
        return null;
      },
    );
  }

  /// HELPERS
  ///
  bool isAllowedEmailProvider(String email) {
    final providers = ['gmail', 'hotmail', 'live', 'outlook', 'yahoo'];
    final emailParts = email.split('@');
    if (emailParts.length == 2) {
      final domain = emailParts[1].toLowerCase();
      return providers.any((provider) => domain.contains(provider));
    }
    return false;
  }

  List<String> _isAllowedPassword(String value) {
    final missingCriteria = <String>[];

    if (value.length < 6) {
      missingCriteria.add('at least 6 characters');
    }

    final letterRegExp = RegExp(r'[a-zA-Z]');
    final numberRegExp = RegExp(r'\d');
    final specialCharRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (!letterRegExp.hasMatch(value)) {
      missingCriteria.add('at least one letter');
    }

    if (!numberRegExp.hasMatch(value)) {
      missingCriteria.add('at least one number');
    }

    if (!specialCharRegExp.hasMatch(value)) {
      missingCriteria.add('at least one special character');
    }

    return missingCriteria;
  }
}
