import 'package:flutter/material.dart';
import 'package:quik_sort/dummyData/event_list.dart';
import 'package:quik_sort/screens/event_description.dart';
import 'package:quik_sort/widgets/event_list_item.dart';

class QuiksortScreen extends StatelessWidget {
  static const routName = 'quiksort_screen';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: EventList.length,
      itemBuilder: ((context, index) {
        print(EventList[index].datetime);
      return EventListItem(
        id: EventList[index].id, 
        title: EventList[index].title, 
        imageUrl: EventList[index].img, 
        description: EventList[index].description,
        datetime: EventList[index].datetime,
        );
    }));
  }
}
