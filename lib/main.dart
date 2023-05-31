import 'package:anotes/philanthropy/models/topic_model.dart';
import 'package:anotes/philanthropy/screens/philanthropy_screen.dart';
import 'package:anotes/providers/authentication_provider.dart';
import 'package:anotes/ui/authentication/register_screen.dart';
import 'package:anotes/ui/components/forms.dart';
import 'package:anotes/ui/components/inputs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
Integrate the Authentication flow in the main app:

In the main app, you can wrap the root widget with the necessary providers, 
including the AuthenticationProvider.

By doing this, the authentication state will be accessible throughout the app.

You can listen to the authentication state changes using 
a Consumer widget or by directly accessing the provider in the 
widget tree to show different screens based on the user's authentication state.

For example, if the user is authenticated, 
you can navigate to the home screen. Otherwise, 
you can navigate to the login/register screen.

 */
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TopicProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
      ],
      builder: (context, child) => const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anotes API',

      ///appTheme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),

      ///
      ///TESTING
      ///
      home: const Tester(), //RegisterScreen() //PhilanthropyScreen(),
    );
  }
}

class Tester extends StatelessWidget {
  const Tester({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    // ignore: unused_local_variable
    final TextEditingController numberController = TextEditingController();
    // ignore: unused_local_variable
    final TextEditingController textController = TextEditingController();

    return Scaffold(
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Forms(
                        onSubmit: (Map<String, String> values) {
                          // Handle login logic using the submitted form values
                          final email = values['email'];
                          final password = values['password'];
                          // Perform login authentication and navigation logic
                          // ignore: avoid_print
                          print('processed $email, $password');
                        },
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
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Trigger form submission
                              Forms.of(context)?.submitForm();
                            },
                            child: const Text('Submit'),
                          ),
                        ]),
                  ],
                ))));
  }
}
