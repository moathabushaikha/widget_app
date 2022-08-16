import 'package:flutter/material.dart';
import 'package:widget_app/models/user_server.dart';
import 'package:widget_app/views/home_page/page_slider.dart';
import 'package:widget_app/views/home_page/segmented_control.dart';
import 'package:widget_app/views/home_page/server_images_page.dart';
import 'home_drawer.dart';
import 'segmented_control.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,  required this.loggedInUser,required this.title}) : super(key: key);
  final String title;
  final User? loggedInUser;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: HomeDrawer(widget.loggedInUser),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              tooltip: 'Back to Login',
              onPressed: () => Navigator.pop(context),
            ),
          ],
          title: Text(widget.title),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.photo)),
              Tab(icon: Icon(Icons.pages),)
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SegmentedControl(),
            ServerImagesPage(),
            PageSlider(),
          ],
        ),
      ),
    );
  }
}
