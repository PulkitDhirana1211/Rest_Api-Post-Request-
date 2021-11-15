import 'package:flutter/material.dart';
import 'package:login_data/models/login_page.dart';

main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.red),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}



