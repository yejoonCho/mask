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
  Future<void> fetch() async {
    var url = Uri.parse('https://gist.githubusercontent.com/'
        'junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/'
        '063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json');
    var response = await http.get(url);
    final jsonResult = jsonDecode(response.body);
    final jsonStores = jsonResult['stores'];

    stores.clear();
    jsonStores.forEach((e) {
      stores.add(Store.fromJson(e));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('마스크 재고 있는 곳 : 0곳')),
      body: Center(
        child: ElevatedButton(
          child: Text('press me'),
          onPressed: () async {
            await fetch();
            print(stores.toString());
          },
        ),
      ),
    );
  }
}
