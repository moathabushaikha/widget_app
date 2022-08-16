import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_remove_user_db.dart';
import 'list_of_users.dart';
import 'location_page.dart';

enum MyTabs { userForm, userData, location }

final Map<MyTabs, Color> myColors = <MyTabs, Color>{
  MyTabs.userForm: const Color(0xff2be00f),
  MyTabs.userData: const Color(0xff1723ad),
  MyTabs.location: const Color(0xffff04fb),
};

class SegmentedControl extends StatefulWidget {
  const SegmentedControl({Key? key}) : super(key: key);

  @override
  State<SegmentedControl> createState() => _SegmentedControlState();
}

class _SegmentedControlState extends State<SegmentedControl> {
  MyTabs chosenSegment = MyTabs.userForm;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 5,),
          CupertinoSegmentedControl<MyTabs>(
            unselectedColor: Colors.orangeAccent.shade100,
            selectedColor: myColors[chosenSegment],
            groupValue: chosenSegment,
            onValueChanged: (MyTabs value) {
              setState(() {
                chosenSegment = value;
              });
            },
            children: const <MyTabs, Widget>{
              MyTabs.userForm: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Names',
                  style: TextStyle(color: CupertinoColors.black),
                ),
              ),
              MyTabs.userData: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'User Data',
                  style: TextStyle(color: CupertinoColors.black),
                ),
              ),
              MyTabs.location: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Location',
                  style: TextStyle(color: CupertinoColors.black),
                ),
              ),
            },
          ),
          if (chosenSegment == MyTabs.userForm)
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(5),
              color: Colors.green,
              child: const UserDBForm(),
            )),

          if (chosenSegment == MyTabs.userData) const ListOfUsers(),
          if (chosenSegment == MyTabs.location) const LocationPage(),
        ],
      ),
    ));
  }
}
