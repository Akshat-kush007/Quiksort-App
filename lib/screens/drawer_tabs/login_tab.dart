import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quik_sort/providers/auth.dart';

import '../../widgets/user_profile.dart';



class LogInScreen extends StatefulWidget {
  static const routeName='lofin-screen';

  
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  //varibles=======================================================================

  @override
  void initState() {
    super.initState();
  }

  //Auth object and methods========================================================

  String _lottie = 'login';

  void _tryLogIn(BuildContext context, Auth auth) async {
    setState(() {
      _lottie = 'loading';
    });
    auth.auth
        ? auth.sigiOut().then((value) {
            setState(() {
              _lottie = 'login';
            });
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
              'SignOut Successfull',
              textAlign: TextAlign.center,
            )));
          }).catchError((err) {
            _handleError(err);
          })
        : auth.signIn().then((value) {
            setState(() {
              _lottie = 'login';
            });
            if(auth.auth){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
              'SignIn Successfull',
              textAlign: TextAlign.center,
            )));
            }
          }).catchError((err) {
            _handleError(err);
          });
  }

  void _handleError(Exception error) async {
    final hasInternet = await InternetConnectionChecker().hasConnection;
    if (hasInternet) {
      setState(() {
        _lottie = 'error';
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Some thing went wrong!',
        textAlign: TextAlign.center,
      )));
      print('Error in loginscreen : ');
      print(error.toString());
    } else {
      setState(() {
        _lottie = 'nointernet';
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'No Internet Connection!',
        textAlign: TextAlign.center,
      )));
    }
  }

  //Wigget tree==================================================================
  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);
    Size size = MediaQuery.of(context).size;
    final height = size.height - MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back)),
              ],
            ),
            SizedBox(
              width: size.width,
              height: height * 0.5,
              child: Center(
                child: auth.auth
                    ? UserProfile(
                        userName: auth.userName,
                        email: auth.email,
                        imageUrl: auth.imageUrl,
                      )
                    : Lottie.asset('assets/animations/${_lottie}.json'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _tryLogIn(context, auth);
              },
              child: Text(auth.auth ? 'LogOut' : 'LogIn'),
            ),

            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Lottie.asset('assets/animations/${_lottie}.json'),
            // ElevatedButton(
            //   onPressed: () {
            //     _tryLogIn(context,auth);
            //   },
            //   child: Text(auth.auth ? 'LogOut' : 'LogIn'),
            // )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
