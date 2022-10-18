import 'package:flutter/material.dart';
import 'package:quik_sort/screens/about.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            // margin: EdgeInsets.all(0),
            decoration: BoxDecoration(
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
                  Text(
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
           ListTile(
            selected: true,
            leading: Icon(Icons.home),
            title: Text(
              'Home',
            ),
            // trailing: ,
            onTap: () {
              
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text(
              'About us',
            ),
            // trailing: ,
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                return Aboutus();
              }));
            },
          ),
          // Expanded(child: Container()),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Logout ',
            ),
            // trailing: ,
            onTap: (() {
              
            }),
          ),
        ],
      ),
    );
  }
}
