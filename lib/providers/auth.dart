import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth with ChangeNotifier{
  //varibler==================================
  String? _userName=null;
  String? _email=null;
  String? _imageUrl=null;


  //providers=================================
  bool get auth{
    return _userName != null;
  }

  String get userName{
    return _userName!;
  }
  String get email{
    return _email!;
  }
  String get imageUrl{
    return _imageUrl!;
  }
  GoogleSignIn _googleSignIn = GoogleSignIn();

  //Functions==================================
  Future signIn() async {
    try {
      final signInInfo = await _googleSignIn.signIn();
      if (signInInfo == null) {
        return;
        // throw Exception('No-SignIn-Info');
      }
      final userData = await signInInfo.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: userData.accessToken,
        idToken: userData.idToken,
      );

      final Instance=await FirebaseAuth.instance.signInWithCredential(credentials);
      final userInfo=Instance.user;
      //Check Instance.authcredential for token
      
        _userName=userInfo!.displayName.toString();
        _email=userInfo.email.toString();
        _imageUrl=userInfo.photoURL.toString();
        // print(_userName);
        // print(_email);
        // print(_imageUrl);
      // print('AddInfo : ${Instance.additionalUserInfo}');
      // print('CredInfo : ${Instance.credential}');
      // print('UserInfo : ${Instance.user}');
      
      notifyListeners();
    } catch (err) {
      // print('Error in sigin function : ');
      // print(err);
      rethrow;
    }
  }

  Future sigiOut() async{
    try{
      await _googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();

      _userName=null;
      _email=null;
      _imageUrl=null;
      notifyListeners();
    }catch(err){
      print('Error in signout function : ');
      print(err);
    }
  }
}
