import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:quik_sort/screens/event_screen.dart';
import 'package:quik_sort/screens/explore_screen.dart';
import 'package:quik_sort/screens/quiksort_screen.dart';
import 'package:quik_sort/widgets/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const routName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Variabls----------------------------------------------
  int _curentPageIndex = 1;
  bool _isLoading = true;
  bool _hasInternet = false;
  final List<Widget> _pages = [
    ExploreScreen(),
    QuiksortScreen(),
    EventsScreen(),
  ];
  //init--------------------------------------------------
  @override
  void initState() {
    super.initState();
    _checkInternet();
  }

  //Functions---------------------------------------------
  void _checkInternet() async {
    setState(() {
      _isLoading = true;
    });
    _hasInternet = await InternetConnectionChecker().hasConnection;
    setState(() {
      _isLoading = false;
      print('connection : ${_hasInternet}');
      print('loading : ${_isLoading}');
    });
  }

  void _setPageIndex(int index) {
    setState(() {
      _curentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quik Sort"),
      ),
      drawer: MyDrawer(DrawerItem.Home),
      //Body======================================================
      // body: _pages[_curentPageIndex],
      body: _isLoading
          ? Center(child: Lottie.asset('assets/animations/load.json'))
          : _hasInternet
              ? _pages[_curentPageIndex]
              : NoConnecionWidget(_checkInternet),
      //Bottom Nav bar===================================================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curentPageIndex,
        onTap: _setPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quora),
            label: 'QuikSort',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_sharp),
            label: 'Events',
          ),
        ],
      ),
    );
  }
}

class NoConnecionWidget extends StatelessWidget {
  VoidCallback _checkInternet;
  NoConnecionWidget(this._checkInternet);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset("assets/animations/error.json",
            width: double.infinity, fit: BoxFit.cover),
        Text(
          "No Internet Connection",
          style: TextStyle(fontSize: 20),
        ),
        TextButton.icon(
            onPressed: () {
              _checkInternet();
            },
            icon: Icon(Icons.refresh),
            label: Text('Reload'))
      ],
    ));
  }
}
