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
        title: const Text("borrow_List.dart"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "My Borrow List",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "Current User : ${widget.userFullName}",
              style: const TextStyle(fontSize: 20.0),
            ),
            //listview
            Expanded(
              child: FutureBuilder(
                future: getBorrowList(),
                builder: (context, snapShot) {
                  switch (snapShot.connectionState) {
                    case ConnectionState.waiting:
                      return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text("Loading..."),
                        ],
                      );
                    case ConnectionState.done:
                      if (snapShot.hasError) {
                        return Text("Eror : ${snapShot.error}");
                      }
                      //display listview
                      return borrowListView();
                    default:
                      return Text("Eror : ${snapShot.error}");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget borrowListView() {
    return ListView.builder(
      itemCount: _borrowList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.book),
            title: Text(_borrowList[index]["equipment_name"]),
            subtitle: Text(_borrowList[index]["bor_detail"]),
            trailing: const Icon(Icons.arrow_right),
          ),
        );
      },
    );
  }

  Future<List> getBorrowList() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
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
