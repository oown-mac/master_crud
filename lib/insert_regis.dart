import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:master_crud/functions/public_functions.dart';
import 'dart:convert';

class InsertRegis extends StatefulWidget {
  const InsertRegis({super.key});

  @override
  State<InsertRegis> createState() => _InsertRegisState();
}

class _InsertRegisState extends State<InsertRegis> {
  TextEditingController useridController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("insert_regis.dart"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Insert Registrations",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 0, 37, 137),
                ),
              ),
              const Gap(30),
              TextField(
                controller: useridController,
                decoration: const InputDecoration(
                  labelText: "UserId",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.numbers),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.password),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: fullnameController,
                decoration: const InputDecoration(
                  labelText: "Fullname",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.abc),
                ),
              ),
              const Gap(30),
              ElevatedButton(
                onPressed: () {
                  saveAdmin();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("SAVE")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveAdmin() async {
    //save data to database
    Uri uri = Uri.parse("http://localhost/master_crud_api/insert_regis.php");

    Map<String, dynamic> data = {
      "userid": useridController.text,
      "username": usernameController.text,
      "password": passwordController.text,
      "fullname": fullnameController.text,
    };

    http.Response response = await http.post(uri, body: data);

    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);

      if (response.body == 1.toString()) {
        showMessageBox(
            context, "Success!", "You have Successfully Insert Registered !");
      } else {
        showMessageBox(context, "Error", "Insert Registered Failed !");
      }
    } else {
      showMessageBox(context, "Error",
          "The server returns a ${response.statusCode} error.");
    }
  }
}
