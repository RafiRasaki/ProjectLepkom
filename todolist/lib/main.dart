import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/screens/home.dart';
import 'package:todolist/screens/splashpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //menjadikan tampilan atas
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodoList Apps',
      routes: {
        '/':(context) => SplashPage(),
        '/home' :(context) => Home(),
      },
    );
  }
}

