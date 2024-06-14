import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;

class Testapi extends StatefulWidget {
  const Testapi({super.key});

  @override
  State<Testapi> createState() => _TestapiState();
}

class _TestapiState extends State<Testapi> {
  String _msg = "Message from API"; ////////  test api   /////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TEST API"),
      ),
      body: Center(
        child: Column(
          children: [
            const Gap(100),
            Text(_msg), ////////  test api   ///////////////////////
            const Gap(20),
            ElevatedButton(
              onPressed: () {
                getMessageFromAPI(); ////////  test api   ///////////////////////
              },
              child: const Text("Test API"),
            ),
          ],
        ),
      ),
    );
  }

  ////////////////  test api   /////////////////////////////////////
  void getMessageFromAPI() async {
    String url = "http://10.40.192.71/master_crud_api/hello_api.php";

    final Map<String, dynamic> queryParams = {
      "name": "Natthpon",
      "address": "Chiang Rai",
    };

    try {
      http.Response response =
          await http.get(Uri.parse(url).replace(queryParameters: queryParams));

      if (response.statusCode == 200) {
        setState(() {
          _msg = response.body;
        });
      } else {
        setState(() {
          _msg = "${response.statusCode} : ${response.reasonPhrase}";
        });
      }
    } catch (error) {
      setState(() {
        _msg = "$error";
      });
    }
  }
}
