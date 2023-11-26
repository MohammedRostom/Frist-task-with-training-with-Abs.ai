import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_auth_with_firebases_auth/firebase_options.dart';
import 'package:task_auth_with_firebases_auth/view/HomePage.dart';
import 'package:task_auth_with_firebases_auth/view/LoginOrSignup_View.dart';
import 'package:task_auth_with_firebases_auth/view/Login_View.dart';
import 'package:task_auth_with_firebases_auth/view/Register_View.dart';
import 'package:task_auth_with_firebases_auth/viewModel/Login_viewModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProividerClassViewModel(),
      child: MaterialApp(
        routes: {
          "/": (context) => LoginOrSignup_View(),
          "HomePage": (context) => HomePage(),
          "Register": (context) => Register_View(),
          "Login": (context) => Login_View(),
        },
        initialRoute: "/",
      ),
    );
  }
}
