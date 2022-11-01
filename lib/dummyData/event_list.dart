
import 'package:quik_sort/models/event.dart';

var EventList=[
  Event(
    id: '1', 
    title: "Synergy", 
    img: 'assets/images/event.jpeg', 
    datetime: DateTime.now().subtract(Duration(days:40,hours: 11)), 
    description: '''If null, and if the [constraints] are unbounded or also null, the container will expand to fill all available space in its parent, unless the parent provides unbounded constraints, in which case the container will attempt to be as small as possible.
                        This widget can only have one child. To lay out multiple children, let this widget's child be a widget such as [Row], [Column], or [Stack], which have a children property, and then provide the children to that widget.''', 
    orgMembers: [
      OrgMember(name: 'Anushka Mathut', designation: 'Head of Department',contact: "1234561230"),
      OrgMember(name: 'Mohd. Shohel', designation: 'co-head',contact: "1223455230"),
      OrgMember(name: 'Mohd. Kaif', designation: 'treasurer',contact: "4356121230"),
    ]
    ),
    Event(
    id: '2', 
    title: "Synergy", 
    img: 'assets/images/event1.jpeg', 
    datetime: DateTime.now().subtract(Duration(days:32,hours: 3)), 
    description: '''If null, and if the [constraints] are unbounded or also null, the container will expand to fill all available space in its parent, unless the parent provides unbounded constraints, in which case the container will attempt to be as small as possible.
                        This widget can only have one child. To lay out multiple children, let this widget's child be a widget such as [Row], [Column], or [Stack], which have a children property, and then provide the children to that widget.''', 
    orgMembers: [
      OrgMember(name: 'Anushka Mathut', designation: 'head',contact: "1234561230"),
      OrgMember(name: 'Mohd. Shohel', designation: 'co-head',contact: "1223455230"),
      OrgMember(name: 'Mohd. Kaif', designation: 'treasurer',contact: "4356121230"),
    ]
    ),
    Event(
    id: '3', 
    title: "Synergy", 
    img: 'assets/images/event2.jpeg', 
    datetime: DateTime.now().subtract(Duration(days:12,hours: 23)), 
    description: '''If null, and if the [constraints] are unbounded or also null, the container will expand to fill all available space in its parent, unless the parent provides unbounded constraints, in which case the container will attempt to be as small as possible.
                        This widget can only have one child. To lay out multiple children, let this widget's child be a widget such as [Row], [Column], or [Stack], which have a children property, and then provide the children to that widget.''', 
    orgMembers: [
      OrgMember(name: 'Anushka Mathut', designation: 'head',contact: "1234561230"),
      OrgMember(name: 'Mohd. Shohel', designation: 'co-head',contact: "1223455230"),
      OrgMember(name: 'Mohd. Kaif', designation: 'treasurer',contact: "4356121230"),
    ]
    )
];
