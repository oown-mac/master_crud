import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Logintomysql extends StatefulWidget {
  const Logintomysql({super.key});

  @override
  State<Logintomysql> createState() => _LogintomysqlState();
}

class _LogintomysqlState extends State<Logintomysql> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login to MySQL"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Gap(20),
              const Text("Login to MySQL"),
              const Gap(20),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "ชื่อผู้ใช้งาน",
                ),
              ),
              const Gap(10),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "รหัสผ่าน",
                ),
              ),
              const Gap(20),
              ElevatedButton(
                onPressed: () {
                  //Navigator.pushNamed(context, "/test_api");
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
