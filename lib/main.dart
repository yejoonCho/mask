import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mask/ui/screen/main_page.dart';
import 'package:mask/provider/store_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(ChangeNotifierProvider.value(
    value: StoreProvider(),
    child: MyApp(),
  ));
}

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
