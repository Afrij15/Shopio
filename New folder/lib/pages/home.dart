import 'package:flutter/material.dart';
import 'package:shopio/pages/home_page.dart';
import 'package:shopio/pages/profile.dart';
import 'package:shopio/pages/search.dart';
import 'package:shopio/pages/stores.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController = PageController();
  List<Widget> _screens = [Home_page(), Search(), Stores(), Profile()];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _itemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _itemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0 ? Colors.amber[800] : Colors.grey,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: _selectedIndex == 0 ? Colors.amber[800] : Colors.grey,
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: _selectedIndex == 1 ? Colors.amber[800] : Colors.grey,
              ),
              title: Text(
                'Search',
                style: TextStyle(
                  color: _selectedIndex == 1 ? Colors.amber[800] : Colors.grey,
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shop,
                color: _selectedIndex == 2 ? Colors.amber[800] : Colors.grey,
              ),
              title: Text(
                'Stores',
                style: TextStyle(
                  color: _selectedIndex == 2 ? Colors.amber[800] : Colors.grey,
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 3 ? Colors.amber[800] : Colors.grey,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: _selectedIndex == 3 ? Colors.amber[800] : Colors.grey,
                ),
              ))
        ],
      ),
    );
  }
}
