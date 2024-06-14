import 'package:flutter/material.dart';
import 'package:master_crud/login_to_mysql.dart';
import 'package:master_crud/menu.dart';
import 'package:master_crud/test_api.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/menu",
      routes: {
        "/menu": (context) => const Menu(),
        "/test_api": (context) => const Testapi(),
        "/login_to_mysql": (context) => const Logintomysql(),
      },
    );
  }
}
