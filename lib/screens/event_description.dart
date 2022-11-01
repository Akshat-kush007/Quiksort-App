import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quik_sort/dummyData/event_list.dart';
import 'package:quik_sort/models/event.dart';



class EventDescription extends StatelessWidget {
  static const routeName = '/event-description';
  //Parameters=======================================================
  final String id;
  EventDescription({required this.id});

  //Varibles=========================================================
  late Event event;
  final _orgTextStyle=const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500
  );

  //Methods==========================================================
  void _extractEvent() {
    event = EventList.firstWhere((element) => element.id == id);
  }

  //WidgetTree=======================================================
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    //Extracting event------------------
    _extractEvent();
    //Scaffold--------------------------
    return Scaffold(
      appBar: AppBar(title: Text('Event Details')),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(event.img),
            ListTile(
              horizontalTitleGap: 1,
              minLeadingWidth: 20,
              leading: const Icon(Icons.account_circle_rounded),
              title: Text('1,32 Participations'),
              trailing: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_to_photos_sharp,
                ),
                label: const Text('Register'),
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: FittedBox(
                child: Text(
                  event.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: FittedBox(
                child: Text(
                  DateFormat.yMEd().format(event.datetime),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                event.description,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
              // indent: 10,
              // endIndent: 10,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
              child: const Text(
                'Organisers:',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
            ...event.orgMembers.map((element){
              return ListTile(
                    leading: SizedBox(
                      width: size.width*0.25,
                      child: Text(element.name,style: _orgTextStyle,)),
                    title: SizedBox(
                      width: size.width-size.width*0.25-120,
                      child: Text(element.designation,style: _orgTextStyle,textAlign: TextAlign.center,)),
                    trailing: SizedBox(
                      width: 100,
                      child: Text(element.contact,style: _orgTextStyle,textAlign: TextAlign.right,)),
                  ); 
            }).toList(),
            const Divider(
              height: 1,
              thickness: 1,
              // indent: 10,
              // endIndent: 10,
            ),
          ],
        ),
      )),
    );
  }
}
