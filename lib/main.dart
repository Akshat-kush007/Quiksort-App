import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quik_sort/providers/auth.dart';
import 'package:quik_sort/screens/event_description.dart';
import 'package:quik_sort/screens/drawer_tabs/home_tab.dart';
import 'package:quik_sort/screens/drawer_tabs/login_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => Auth()),
      child: MaterialApp(
        title: 'QuikSort',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        // home: HomeScreen(),
        routes: {
          '/': ((context) => HomeScreen()),
          // EventDescription.routeName: ((context) => EventDescription()),
          LogInScreen.routeName: ((context) => LogInScreen()),
          // '/': ((context) => HomeScreen()),
        },
      ),
    );
  }
}
