import 'package:flutter/material.dart';
import '../models/description.dart';

class TeamLead extends StatelessWidget {
  final Size size;
  final Description desc;

  TeamLead({required this.size, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      shadowColor: Colors.black45,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              child: Image.asset(
                desc.image,
                height: size.height * 0.25,
                width: size.width * 0.45,
                fit: BoxFit.cover,
              )),
          Container(
            width: size.width * 0.45,
            child: Column(children: [
              FittedBox(
                  child: Text(
                desc.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
              FittedBox(
                  child: Text(
                desc.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  decoration: TextDecoration.underline
                  ),
              )),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      // maximumSize: Size(10, 10)
                      ),
                  child: Text('Know more >>')),
            ]),
          )
        ],
      ),
    );
  }
}
