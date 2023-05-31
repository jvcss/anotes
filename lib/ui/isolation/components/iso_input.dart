import 'package:flutter/material.dart';
import '../../components/inputs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Isolate Input',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const Tester(),
    );
  }
}

class Tester extends StatelessWidget {
  const Tester({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController numberController = TextEditingController();
    final TextEditingController textController = TextEditingController();

    return Scaffold(
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Input(
                      label: 'Email',
                      controller: emailController,
                      inputType: InputType.email,
                    ),
                    Input(
                      label: 'Password',
                      controller: passwordController,
                      inputType: InputType.password,
                    ),
                    Input(
                      label: 'Numeric',
                      controller: numberController,
                      inputType: InputType.numeric,
                      acceptsFloat: true,
                    ),
                    Input(
                      label: 'Text',
                      controller: textController,
                      inputType: InputType.text,
                      multiline: true,
                    ),
                  ],
                ))));
  }
}
