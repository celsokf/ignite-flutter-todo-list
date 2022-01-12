import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'home_controller.dart';
import 'screens/done_screen.dart';
import 'screens/task_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  final _pageViewController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    super.initState();
    autorun((_) {
      _pageViewController.animateToPage(
        controller.selectedIndex,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        children: <Widget>[
          TaskScreen(
            controller: controller,
          ),
          DoneScreen(
            controller: controller,
          ),
        ],
        onPageChanged: (index) {
          controller.selectedIndex = index;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.selectedIndex,
        onTap: (index) {
          controller.selectedIndex = index;
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: 'Pendentes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Concluídas',
          ),
        ],
      ),
    );
  }
}
