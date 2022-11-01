class Event{
  final String id;
  final String title;
  final DateTime datetime;
  final String img;
  final Map<String,String> participations=<String,String>{};
  final String description;
  final List<OrgMember> orgMembers;

  Event({
    required this.id,
    required this.title,
    required this.img,
    required this.datetime,
    required this.description,
    required this.orgMembers,
  });
}

class OrgMember{
  final String name;
  final String designation;
  final String contact;

  OrgMember({
    required this.name,
    required this.designation,
    this.contact='',
  });
}