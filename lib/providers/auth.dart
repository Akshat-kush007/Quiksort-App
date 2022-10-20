import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth with ChangeNotifier{
  //varibler==================================
  bool _isSignIn=false;

  //providers=================================
  bool get auth{
    return _isSignIn;
  }

  GoogleSignIn _googleSignIn = GoogleSignIn();

  //Functions==================================
  Future signIn() async {
    try {
      final signInInfo = await _googleSignIn.signIn();
      if (signInInfo == null) {
        throw Exception('No SignIn Info');
      }
      final userData = await signInInfo.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: userData.accessToken,
        idToken: userData.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credentials);
      
      _isSignIn=true;
      notifyListeners();
    } catch (err) {
      print('Error in sigin function : ');
      print(err);
      rethrow;
    }
  }

  Future sigiOut() async{
    try{
      await _googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();

      _isSignIn=false;
      notifyListeners();
    }catch(err){
      print('Error in signout function : ');
      print(err);
    }
  }
}
