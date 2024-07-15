import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BorrowList extends StatefulWidget {
  //const BorrowList({super.key});
  final String userid;
  final String userFullName;

  BorrowList({
    required this.userid,
    required this.userFullName,
  });

  @override
  State<BorrowList> createState() => _BorrowListState();
  //_BorrowListState createState() => _BorrowListState();
}

class _BorrowListState extends State<BorrowList> {
  List<dynamic> _borrowList = [];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    List myList = await getBorrowList();

    print(myList);

    setState(() {
      _borrowList = myList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Borrow List"),
      ),
    );
  }

  Future<List> getBorrowList() async {
    String url = "http://localhost/master_crud_api/get_borrowlist.php";

    final Map<String, dynamic> queryParams = {
      "userid": widget.userid.toString(),
    };
    http.Response response =
        await http.get(Uri.parse(url).replace(queryParameters: queryParams));

    if (response.statusCode == 200) {
      var borrow = jsonDecode(response.body);
      //print(response.body);

      return borrow;
    } else {
      return ["not ok"];
    }
  }
}
