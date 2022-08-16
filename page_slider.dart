import 'package:flutter/material.dart';

class PageSlider extends StatefulWidget {
  const PageSlider({Key? key}) : super(key: key);

  @override
  State<PageSlider> createState() => _PageSliderState();
}

class _PageSliderState extends State<PageSlider> {
  final pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: pageController,
      children: [
        Container(
          color: Colors.brown,
          child: const Center(
              child: Text(
            'Brown Page',
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          )),
        ),
        Container(
            color: Colors.red,
            child: const Center(
                child: Text('Red Page',
                    style:
                        TextStyle(fontSize: 60, fontWeight: FontWeight.bold)))),
        Container(
            color: Colors.teal,
            child: const Center(
                child: Text('Teal Page',
                    style:
                        TextStyle(fontSize: 60, fontWeight: FontWeight.bold)))),
        Container(
            color: Colors.purple,
            child: const Center(
                child: Text('Purple Page',
                    style:
                        TextStyle(fontSize: 60, fontWeight: FontWeight.bold))))
      ],
    );
  }
}
