import 'package:flutter/material.dart';
import 'package:tasktracker/auth/screens/signup_screen.dart';
import 'package:tasktracker/constants/global_variables.dart';
import 'package:tasktracker/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(scaffoldBackgroundColor: GlobalVariables.backgroundColor),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => generateRouteSettings(settings),
        home: SignupScreen());
  }
}
