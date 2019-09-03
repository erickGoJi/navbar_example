import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:navbar_example/pages/chat.dart';
import 'package:navbar_example/pages/profile.dart';
import 'package:navbar_example/pages/users.dart';

void main() => runApp(
    MaterialApp(home: BottomNavBar(), debugShowCheckedModeBanner: false));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  final Users _pageUsers = Users();
  final Profile _pageProfile = Profile();
  final Chat _pageChat = Chat();
  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget _showPage = new Chat();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _pageChat;
        break;
      case 1:
        return _pageUsers;
        break;
      case 2:
        return _pageProfile;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeOutCirc,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: _showPage,
          ),
        ));
  }
}
