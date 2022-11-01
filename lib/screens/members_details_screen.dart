import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quik_sort/models/members_description.dart';

class MembersDetailsScreen extends StatelessWidget {
  final Members_Description desc;
  MembersDetailsScreen({required this.desc});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuikSort Member'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 4,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.asset(
                      desc.image,
                      height: size.height * 0.6,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    height:  2,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Text(desc.name,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    trailing: Text(desc.title,style: const TextStyle(fontSize: 20)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(desc.decsription,textAlign: TextAlign.left,style: const TextStyle(fontSize: 18),),
            )
          ],
        ),
      )),
    );
  }
}
