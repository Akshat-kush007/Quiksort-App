import 'package:flutter/material.dart';
import 'package:quik_sort/widgets/my_drawer.dart';

class ProfileScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile page"),
      ),
      // drawer: MyDrawer(DrawerItem.Profile),
      body: Center(child: Text('User Profile')),
    );
  }
}