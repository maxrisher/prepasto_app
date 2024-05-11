import 'package:flutter/material.dart';
import 'camera_screen.dart';
import 'diary_log_screen.dart';

class MainScreen extends StatefulWidget{
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentScreenIndex = 1; //default first screen idex

  final List<Widget> _children = [
    DiaryLogScreen(),
    CameraScreen(),
    // add other screens to be selected
  ];

  void onTabTapped(int tappedIndex){
    setState(() {
      _currentScreenIndex = tappedIndex;
    });
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('2500-500=2000')),
      body: _children[_currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Diary',),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Camera',),
          ],
        ),
    );
  }
}