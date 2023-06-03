import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import '../../providers/authentication_provider.dart';
import '../components/inputs.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController emailController = TextEditingController();

  late TextEditingController passwordController = TextEditingController();

  bool isFormValidated = false;

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
                Form(
                  onWillPop: () async {
                    bool shouldPop = await showConfirmationDialog(
                        context, 'Confirm', 'You really want to leave me?');
                    return shouldPop;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Input(
                        label: 'E-mail',
                        controller: emailController,
                        inputType: InputType.email,
                      ),
                      Input(
                        label: 'Password',
                        controller: passwordController,
                        inputType: InputType.password,
                      ),
                    ],
                  ),
                  onChanged: () async {
                    if (!isFormValidated) {
                      isFormValidated = true;
                      if (_formKey.currentState?.validate() == true) {
                        bool shouldGo = await showConfirmationDialog(
                            context, 'Confirm', "You sure that's all? ");
                        if (shouldGo) {
                          _showToast(context);
                        }

                        //_formKey.currentState?.save();
                        //_showToast(context);

                        //_registerUser(context);
                      }
                    } else {
                      isFormValidated = false;
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    bool shouldGo = await showConfirmationDialog(
                        context, 'Confirm', "You sure that's all? ");
                    if (shouldGo) {
                      _showToast(context);
                    }
                  }, //_registerUser(context),
                  child: const Text('Confirm'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final txt = 'EMAIL: $email, PASSWORD: $password'; // Modified content

    scaffold.showSnackBar(
      SnackBar(
        content: Text(txt), // Displaying the content of txt
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: scaffold.hideCurrentSnackBar,
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
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
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

  Future showConfirmationDialog(
      BuildContext context, String title, String content) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              // Return true to allow the action
              Navigator.of(context).pop(true);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              // Return false to prevent the action
              Navigator.of(context).pop(false);
            },
            child: const Text('No'),
          ),
        ],
      ),
    );
  }
}
