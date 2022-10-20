import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quik_sort/providers/auth.dart';

enum LogIn {
  login,
  logout,
}

class LogInScreen extends StatefulWidget {
  final LogIn authentication;
  LogInScreen(this.authentication);
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  //varibles=======================================================================
  bool _isLoading = false;
  

  @override
  void initState() {
    super.initState();
  }

  //Auth object and methods========================================================
 
  String _lottie = 'login';

  void _tryLogIn(BuildContext context ,Auth auth) async {
    setState(() {
      _isLoading = true;
       _lottie='loading';
    });
    auth.auth
        ? auth.sigiOut().then((value) {
            setState(() {
              
              _lottie='login';
            });
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
              'SignOut Successfull',
              textAlign: TextAlign.center,
            )));
          }).catchError((err) {
            print('Error in logout');
            print(err);
            setState(() {
               _lottie='error';
            });
          }).whenComplete(() {
            setState(() {
              _isLoading = false;
            });
          })
        : auth.signIn().then((value) {
            setState(() {
              
               _lottie='success';
            });
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
              'SignIn Successfull',
              textAlign: TextAlign.center,
            )));
          }).catchError((err) {
            setState(() {
               _lottie='error';
            });
            print('Error in signIn : ');
            print(err);
          }).whenComplete(() {
            setState(() {
              _isLoading = false;
            });
          });
  }
  //Wigget tree==================================================================
  @override
  Widget build(BuildContext context) {
     final Auth auth = Provider.of<Auth>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          Container(
            width: size.width,
            height: size.height - 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset('assets/animations/${_lottie}.json'),
                ElevatedButton(
                  onPressed: () {
                    _tryLogIn(context,auth);
                  },
                  child: Text(auth.auth ? 'LogOut' : 'LogIn'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
