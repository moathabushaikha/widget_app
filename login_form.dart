import 'package:flutter/material.dart';
import 'package:widget_app/services/api_service.dart';
import '../home_page/home_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController userNameField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 35,
        ),
        //user name textField
        SizedBox(
          width: 390,
          child: TextField(
            controller: userNameField,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.orangeAccent.shade100,
              icon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              labelText: 'Email',
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        SizedBox(
          width: 390,
          child: TextField(
            controller: passwordField,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.orangeAccent.shade100,
              icon: const Icon(Icons.key),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              labelText: 'Password',
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              // checks if the email and password exists
              String username = userNameField.text,
                  password = passwordField.text;
              List checkAuth = await ApiService().checkUser(username, password);
              print(checkAuth);
              if (checkAuth[0] && checkAuth[1]) {
                if (!mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            loggedInUser: checkAuth[2],
                            title: 'Progressoft Task',
                          )),
                );
              }
            },
            child: const Text('Sign in')),
        TextButton(
          child: const Text(
            'Use app without sign in',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          onPressed: () {
            // log in anonymous
          },
        )
      ],
    );
  }
}
