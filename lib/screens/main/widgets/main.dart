import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intra/screens/home/view/home_page.dart';
import 'package:intra/theme.dart';

import 'layout.dart';
import 'fab_bottom_app_bar.dart';
import 'fab_with_icons.dart';

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final _pages = List<Widget>.unmodifiable([
    HomePage(),
    Container(color: Colors.green),
    Container(color: Colors.amber),
    Container(color: Colors.lightBlueAccent)
  ]);

  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
      _currentIndex = index;
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      top: false,
      color: white3,
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: InkWell(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            width: 60,
            height: 60,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFC0B9DD),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onTap: () {},
        ),
        bottomNavigationBar: FABBottomAppBar(
          centerItemText: '',
          color: theme.primaryColor,
          selectedColor: theme.primaryColorDark,
          onTabSelected: _selectedTab,
          items: [
            _generateButton(IconName.home),
            _generateButton(IconName.notifications),
            _generateButton(IconName.help),
            _generateButton(IconName.settings),
          ],
        ),
      )
    );
  }

  Widget _generateButton(IconName iconName) {
    final asset = 'assets/navbar_' +
        (iconName.index == _currentIndex ? '' : 'un') +
        'selected_${iconName.toString().split('.').last}.svg';

    return Container(
      padding: EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
      child: SvgPicture.asset(asset),
    );
  }
}

enum IconName { home, notifications, help, settings }
