import 'package:flutter/material.dart';
import 'package:quik_sort/screens/members_details_screen.dart';
import '../models/members_description.dart';

class MembersCard extends StatelessWidget {
  final Size size;
  final Members_Description desc;

  MembersCard({required this.size, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      shadowColor: Colors.black45,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              child: Image.asset(
                desc.image,
                height: size.height * 0.25,
                width: size.width * 0.45,
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: size.width * 0.45,
            child: Column(children: [
              FittedBox(
                  child: Text(
                desc.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
              FittedBox(
                  child: Text(
                desc.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  decoration: TextDecoration.underline
                  ),
              )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>MembersDetailsScreen(desc: desc))
                    );
                  },
                  style: TextButton.styleFrom(
                      // maximumSize: Size(10, 10)
                      ),
                  child: const Text('Know more >>')),
            ]),
          )
        ],
      ),
    );
  }
}
