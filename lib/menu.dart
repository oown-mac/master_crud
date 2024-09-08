import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu.dart"),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: Column(
          children: [
            const Gap(30),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/test_api");
              },
              child: const Text("Test API"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/test_api");
              },
              child: const Text("Test API"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/login_to_mysql");
              },
              child: const Text("Login to MySQL"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/insert_regis");
              },
              child: const Text("Insert Registration"),
            ),
          ],
        ),
      ),
    );
  }
}
