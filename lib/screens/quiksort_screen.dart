import 'package:flutter/material.dart';

class QuiksortScreen extends StatelessWidget {
  static const routName = 'quiksort_screen';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    child: Image.asset('assets/images/event.jpeg')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  onTap: (){},
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
                  trailing: Icon(Icons.add),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                      child: Text(
                        'Description:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    Text(
                        '''If null, and if the [constraints] are unbounded or also null, the container will expand to fill all available space in its parent, unless the parent provides unbounded constraints, in which case the container will attempt to be as small as possible.
This widget can only have one child. To lay out multiple children, let this widget's child be a widget such as [Row], [Column], or [Stack], which have a children property, and then provide the children to that widget.'''),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Know more >>',
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    child: Image.asset('assets/images/event1.jpeg')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
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
                  trailing: Icon(Icons.add),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
