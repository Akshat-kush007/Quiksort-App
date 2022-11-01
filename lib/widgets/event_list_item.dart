import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/event_description.dart';

class EventListItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final DateTime datetime;

  EventListItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.datetime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => EventDescription(id: id))));
            },
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                child: Image.asset(
                  imageUrl,
                  width: double.infinity,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              onTap: () {
                //Go to registration page!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
              },
              minLeadingWidth: 20,
              horizontalTitleGap: 1,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 2, color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(30)),
              leading: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("1,23  Participations"),
              trailing: const Icon(Icons.add),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: FittedBox(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: FittedBox(
                    child: Text(
                      DateFormat.yMEd().format(datetime),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
               Container(
                width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: const Text(
                    'Description:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
                Text(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => EventDescription(id: id))));
                  },
                  child: const Text(
                    'Know more >>',
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
