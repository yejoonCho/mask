import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mask/ui/screen/main_page.dart';
import 'package:mask/viewmodel/store_model.dart';

void main() => runApp(ChangeNotifierProvider.value(
      value: StoreModel(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage());
  }
}
