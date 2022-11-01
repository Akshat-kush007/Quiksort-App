import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String userName;
  final String email;
  final String imageUrl;
  UserProfile(
      {required this.userName, required this.email, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(imageUrl),
          // backgroundImage: NetworkImage(
          //     'https://lh3.googleusercontent.com/a/ALm5wu1KLFFtX8xnSeZGt6v8XW5MxwwGR_qLR8LoBqW8=s96-c'),
        ),
        Text(
          userName,
          // 'The Land of Devil',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          email,
          // 'aksben10@gmail.com',
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
