import 'package:flutter/material.dart';
import 'package:quik_sort/screens/event_screen.dart';
import 'package:quik_sort/screens/explore_screen.dart';
import 'package:quik_sort/screens/quiksort_screen.dart';
import 'package:quik_sort/widgets/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const routName='/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Variabls----------------------------------------------
  int _curentPageIndex=1;
  final List<Widget> _pages=[
    ExploreScreen(),
    QuiksortScreen(),
    EventsScreen(),
  ];


  //Functions---------------------------------------------
  void _setPageIndex(int index){
    setState(() {
      _curentPageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quik Sort"),
      ),
      drawer: MyDrawer(),
      body: _pages[_curentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curentPageIndex,
        onTap: _setPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Explore'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quora),
            label: 'QuickSort'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_sharp),
            label: 'Events'
          ),
        ],
      ),
    );
  }
}