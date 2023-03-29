import 'package:flutter/material.dart';
import 'package:multi_role_base_app/teacher_screen.dart';
import './home_screen.dart';
import './splash_screen.dart';
import 'auth_screen.dart';
import './student_screen.dart';
import './admin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomeScreen.routeName : (ctx) => const HomeScreen(),
        LoginScreen.routeName : (ctx) => const LoginScreen(),
        StudentScreen.routeName : (ctx) => const StudentScreen(),
        TeacherScreen.routeName : (ctx) => const TeacherScreen(),
        AdminScreen.routeName : (ctx) => const AdminScreen(),

      },
      home: const SplashScreen(),
    );
  }
}