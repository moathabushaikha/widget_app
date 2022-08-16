import 'package:flutter/material.dart';

import 'login_form.dart';
class MyLogInPage extends StatefulWidget {
  const MyLogInPage({Key? key}) : super(key: key);

  @override
  State<MyLogInPage> createState() => MyLogInPageState();
}

class MyLogInPageState extends State<MyLogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        centerTitle: true,
      ),
      body:LoginForm(),
    );
  }
}
