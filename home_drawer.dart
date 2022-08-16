import 'package:flutter/material.dart';
import '../../models/user_server.dart';
import '../../utilities/my_colors.dart';
class HomeDrawer extends StatelessWidget {
  final User? currentUser;
  const HomeDrawer(this.currentUser, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: MyColors.myOrange3,
            ),
            child: Image.asset('images/user.png'),
          ),
          ListTile(

            title: Text('Welcome ${currentUser?.name}'),
            onTap: () {
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
