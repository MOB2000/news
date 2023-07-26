import 'package:flutter/material.dart';
import 'package:news/constants/colors.dart';
import 'package:news/constants/strings.dart';
import 'package:news/constants/styles.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  final _screens = [
    const HomeScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _screens[_index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        backgroundColor: kMainColor,
        iconSize: kBottomNavigationBarIconSize,
        unselectedItemColor: kTitleColor,
        unselectedFontSize: kBottomNavigationBarFontSize,
        selectedFontSize: kBottomNavigationBarFontSize,
        type: BottomNavigationBarType.fixed,
        fixedColor: kGrey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: kHome,
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: kSearch,
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
