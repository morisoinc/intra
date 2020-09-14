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
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        child: Container(
          margin: const EdgeInsets.only(top:30),
          width: 60,
          height: 60,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Color(0xFFC0B9DD),
              borderRadius: BorderRadius.circular(30)
          ),
        ),
        onTap: (){},
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: '',
        color: theme.primaryColor,
        selectedColor: theme.primaryColorDark,
        onTabSelected: _selectedTab,
        items: [
          // FABBottomAppBarItem(iconData: Icons.home, text: "home"),
          // FABBottomAppBarItem(iconData: Icons.notifications, text: "notif"),
          // FABBottomAppBarItem(iconData: Icons.help, text: "help"),
          // FABBottomAppBarItem(iconData: Icons.settings, text: "settings"),
          Container(
              padding: EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
              child: SvgPicture.asset('assets/navbar_home.svg'),
            alignment: Alignment.center,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
              child: SvgPicture.asset('assets/navbar_notifications.svg')
          ),
          Container(
            padding: EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
              child: SvgPicture.asset('assets/navbar_help.svg'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
              child: SvgPicture.asset('assets/navbar_settings.svg'),
          ),
        ],
      ),
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.sms, Icons.mail, Icons.phone];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
        backgroundColor: theme.primaryColor,
      ),
    );
  }
}
