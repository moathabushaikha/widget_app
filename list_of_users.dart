import 'package:flutter/material.dart';
import '../../models/user_database.dart';
import '../../data_base/database_conn.dart';

class ListOfUsers extends StatefulWidget {
  const ListOfUsers({Key? key}) : super(key: key);

  @override
  State<ListOfUsers> createState() => _ListOfUsersState();
}

class _ListOfUsersState extends State<ListOfUsers> {
  List<UserDB?> listOfDbUsers = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getDbUsers();
  }

  @override
  void getDbUsers() async {
    listOfDbUsers = await DataBaseConn.instance.readAllUsers();
    setState(() {});
  }

  @override
  void dispose() {
    DataBaseConn.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var o = 0; o < listOfDbUsers.length; o++)
                Text(
                    'user id : ${listOfDbUsers[o]?.id.toString() ?? 'Loading ...'}'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('user id : ${listOfDbUsers[1]?.id.toString()}'),
              Text('First Name: ${listOfDbUsers[1]?.name.toString()}'),
              Text('email: ${listOfDbUsers[1]?.email.toString()}'),
              Text('password: ${listOfDbUsers[1]?.username.toString()}'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[300],
          child: const Text('Welcome To ProgresSoft'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[400],
          child: const Text('Flutter Documentation'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[500],
          child: const Text('Nothing to show here'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[600],
          child: const Text('I love Programming '),
        ),
      ],
    ));
  }
}
