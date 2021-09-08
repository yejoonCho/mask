import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mask/model/store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final stores = <Store>[];
  var isLoading = true;

  Future<void> fetch() async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.parse('https://gist.githubusercontent.com/'
        'junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/'
        '063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json');
    var response = await http.get(url);
    final jsonResult = jsonDecode(response.body);
    final jsonStores = jsonResult['stores'];

    setState(() {
      stores.clear();
      jsonStores.forEach((e) {
        stores.add(Store.fromJson(e));
      });
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('마스크 재고 있는 곳 : ${stores.length}곳'),
          actions: [IconButton(icon: Icon(Icons.refresh), onPressed: fetch)],
        ),
        body: isLoading
            ? loadingWidget()
            : ListView(
                children: stores.map((e) {
                return ListTile(
                  title: Text(e.name!),
                  subtitle: Text(e.addr!),
                  trailing: Text(e.remainStat ?? '매진'),
                );
              }).toList()));
  }

  Widget loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('정보를 가져오는 중'),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
