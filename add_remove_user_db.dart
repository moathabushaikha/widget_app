import 'package:flutter/material.dart';
import 'package:widget_app/data_base/database_conn.dart';
import 'package:widget_app/models/user_database.dart';

class UserDBForm extends StatefulWidget {
  const UserDBForm({Key? key}) : super(key: key);

  @override
  State<UserDBForm> createState() => _UserDBFormState();
}

class _UserDBFormState extends State<UserDBForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  int userId = 1;

  @override
  void controllerClear() {
    _nameController.clear();
    _imageController.clear();
    _passwordController.clear();
    _emailController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50,),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: 300,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.orangeAccent.shade100,
                        icon: const Icon(Icons.email,color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          const BorderSide(color: Colors.yellow, width: 5),
                        ),
                        labelText: 'Email',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email Cannot be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: 300,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.orangeAccent.shade100,
                        icon: const Icon(Icons.key,color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          const BorderSide(color: Colors.yellow, width: 5),
                        ),
                        labelText: 'Password',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'password cannot be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: 300,
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.orangeAccent.shade100,
                        icon: const Icon(Icons.supervised_user_circle,color: Colors.white,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          const BorderSide(color: Colors.yellow, width: 5),
                        ),
                        labelText: 'User first name',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name Cannot be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                List<UserDB?> allUsers;
                allUsers = await DataBaseConn.instance.readAllUsers();
                userId = allUsers.length+1;
                UserDB user = UserDB(
                    id: userId,
                    name: _nameController.text,
                    email: _emailController.text,
                    username: _passwordController.text);
                await DataBaseConn.instance.createUser(user);
                setState(() {
                  controllerClear();
                });
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Add user to DB'),
            ),
          ],
        ));
  }
}
