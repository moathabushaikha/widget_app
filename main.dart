import 'package:flutter/material.dart';
import 'package:widget_app/utilities/app_theme.dart';
import 'package:widget_app/utilities/my_colors.dart';
import 'package:widget_app/views/Login/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( brightness: Brightness.light,
        primarySwatch: Colors.orange,fontFamily: 'Aboreto-Regular'),
      home: const MyLogInPage(),
    );
  }
}