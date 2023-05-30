import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import '../../providers/authentication_provider.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, Colors.cyanAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'meu_melhor_email@gmail.com',
                      prefixIconColor: Colors.white70,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.email),
                      )),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                    /*if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!EmailValidator.validate(value)) {
                      return 'Please enter a valid email address';
                    }
                    if (!isAllowedEmailProvider(value)) {
                      return 'Please use a supported email provider (e.g., Google, Hotmail, Yahoo)';
                    }
                    return null;*/
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: '******',
                      prefixIconColor: Colors.white70,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.lock),
                      ),
                      suffixIconColor: Colors.blueGrey,
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.visibility),
                      )),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password should be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => {}, //_registerUser(context),
                  child: const Text('Confirm'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isAllowedEmailProvider(String email) {
    final providers = ['google', 'hotmail', 'live', 'outlook', 'yahoo'];
    final emailParts = email.split('@');
    if (emailParts.length == 2) {
      final domain = emailParts[1].toLowerCase();
      return providers.any((provider) => domain.contains(provider));
    }
    return false;
  }

  void _registerUser(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    if (isAllowedEmailProvider(email) && EmailValidator.validate(email)) {
      authProvider.registerUser(email, password).then((error) {
        if (error == null) {
          print('Registration successful');
          // Registration successful
          // Do something (e.g., navigate to home screen)
        } else {
          // Registration failed
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Registration Error'),
              content: Text(error),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      });
    }
  }
}
