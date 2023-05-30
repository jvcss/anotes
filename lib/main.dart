import 'package:anotes/philanthropy/models/topic_model.dart';
import 'package:anotes/philanthropy/screens/philanthropy_screen.dart';
import 'package:anotes/providers/authentication_provider.dart';
import 'package:anotes/ui/authentication/register_screen.dart';
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
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          useMaterial3: true,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.white, // Set the desired caret color
            selectionHandleColor:
                Colors.lightBlue, // Set the desired selection handle color
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            focusColor: Colors.white,
            fillColor: Colors.transparent,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white70),
            ),
            activeIndicatorBorder: BorderSide(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        home: RegisterScreen() //PhilanthropyScreen(),
        );
  }
}
