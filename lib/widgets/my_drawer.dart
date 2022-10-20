import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quik_sort/screens/about.dart';
import 'package:quik_sort/screens/home_screen.dart';
import 'package:quik_sort/screens/login_screen.dart';
import 'package:quik_sort/screens/profile.dart';

import '../providers/auth.dart';

enum DrawerItem {
  Home,
  Aboutus,
  Profile,
}

class MyDrawer extends StatelessWidget {
  final DrawerItem _drawerItem;
  MyDrawer(this._drawerItem);
  bool _isLogin = false;
  bool _isAdmin = true;
  @override
  Widget build(BuildContext context) {
    final auth=Provider.of<Auth>(context);
    return Drawer(
      child: Column(
        children: [
          //Drawer Header ================================================
          DrawerHeader(
            // margin: EdgeInsets.all(0),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/p2.jpg',
                    ),
                    fit: BoxFit.cover)),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/quiksort.png',
                    height: 80,
                  ),
                  const Text(
                    'Quiksort',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          //Drawer list==================================================
          ListTile(
            selected: _drawerItem == DrawerItem.Home,
            leading: Icon(Icons.home),
            title: const Text(
              'Home',
            ),
            // trailing: ,
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
              // return HomeScreen();
              // }));
            },
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            selected: _drawerItem == DrawerItem.Aboutus,
            leading: Icon(Icons.info_outline),
            title: const Text(
              'About us',
            ),
            // trailing: ,
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return Aboutus();
              }));
            },
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          if (_isLogin)
            ListTile(
              selected: _drawerItem == DrawerItem.Profile,
              leading: Icon(Icons.account_circle),
              title: const Text(
                'Profile',
              ),
              // trailing: ,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return ProfileScreen();
                }));
              },
            ),
          if (_isLogin)
            const Divider(
              height: 1,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),

          ListTile(
            leading:
                Icon(auth.auth ? Icons.logout_outlined : Icons.login_rounded),
            title: Text(
              auth.auth ? 'Logout' : 'Login ',
            ),
            // trailing: ,
            onTap: (() {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return auth.auth
                    ? LogInScreen(LogIn.logout)
                    : LogInScreen(LogIn.login);
              }));
            }),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          //Admin Access=================================================
          if (_isLogin && _isAdmin) Expanded(child: Container()),
          if (_isLogin && _isAdmin)
            ListTile(
              title: const Text(
                'Admin Access ',
              ),
              trailing: const Icon(Icons.navigate_next),
              // trailing: ,
              onTap: (() {}),
            ),
        ],
      ),
    );
  }
}
