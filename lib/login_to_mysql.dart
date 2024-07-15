import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:master_crud/borrow_list.dart';

class Logintomysql extends StatefulWidget {
  const Logintomysql({super.key});

  @override
  State<Logintomysql> createState() => _LogintomysqlState();
}

class _LogintomysqlState extends State<Logintomysql> {
  String _msg = "";
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("login_to_mysql.dart"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Gap(20),
              const Text("Login to MySQL"),
              const Gap(20),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "username",
                ),
              ),
              const Gap(10),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "password",
                ),
              ),
              const Gap(20),
              ElevatedButton(
                onPressed: () {
                  login();
                  //Navigator.pushNamed(context, "/test_api");
                },
                child: const Text("Login"),
              ),
              const Gap(20),
              Text(
                _msg,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    String url = "http://localhost/master_crud_api/login.php";

    final Map<String, dynamic> queryParams = {
      "username": _usernameController.text,
      "password": _passwordController.text,
    };
    try {
      http.Response response =
          await http.get(Uri.parse(url).replace(queryParameters: queryParams));
      if (response.statusCode == 200) {
        var user = jsonDecode(response.body); //return type list<map>
        if (user.isNotEmpty) {
          setState(() {
            print(response.body); // for test json response
            //_msg = response.body;
            _msg = user[0]['adm_fullname'];
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BorrowList(
                    userid: user[0]['user_id'],
                    userFullName: user[0]['adm_fullname']),
              ),
            );
          });
        } else {
          setState(() {
            _msg = "Invalid Username or Password";
          });
        }
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (error) {
      setState(() {
        _msg = "$error";
      });
    }
  }
}
