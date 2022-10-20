import 'package:flutter/material.dart';
import 'package:quik_sort/models/member_data.dart';
import 'package:quik_sort/widgets/my_drawer.dart';
import 'package:quik_sort/widgets/team_lead_item.dart';

class Aboutus extends StatelessWidget {
  static const routName = 'aboutus';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      // drawer: MyDrawer(DrawerItem.Aboutus),
      body: ListView(
        children: [
          Stack(children: [
            Container(
              height: size.height * 0.275,
              width: double.infinity,
              child: Image.asset(
                'assets/images/about.jpeg',
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.white])),
            ),
            Container(
              height: size.height * 0.275,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.6, 1],
                colors: [Colors.transparent, Colors.white],
              )),
            ),
          ]),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Text(
              'Quiksort - the “Techies” of Ramanujan, is a society of Computer Science students formed in August 2013. The Society is engaged in numerous departmental and IT-related activities like website development, video editing, poster designing for various fests, workshops, and launching information technology awareness programmes. Few fun events are too conducted occasionally to connect with the students of other departments. An annual tech fest is organised under Quiksort, named Turington. Various technical and non-technical events are conducted by the students under Turington every year.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(
            indent: size.width * 0.1,
            endIndent: size.width * 0.1,
            color: Colors.grey,
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3.0,
                      color: Color.fromARGB(255, 51, 204, 255),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'The vision of this society is to make people more innovative, confident , focused, leaders with develop personality and team work quality .',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
                  ),
                ),
                Positioned(
                    left: size.width * 0.5 - 62,
                    top: 12,
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      color: Colors.white,
                      child: Text(
                        'Our Vision',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
          ),
          Divider(
            indent: size.width * 0.1,
            endIndent: size.width * 0.1,
            color: Colors.grey,
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, top: 8),
            child: Text(
              'Team Leads',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // decoration: TextDecoration.underline
              ),
            ),
          ),
          Container(
            height: size.height * 0.4 + 20,
            width: size.width,
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TeamLead(size: size, desc: TeamLeadList[0]),
                TeamLead(size: size, desc: TeamLeadList[1]),
                TeamLead(size: size, desc: TeamLeadList[2])
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, top: 8),
            child: Text(
              'Society Members',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // decoration: TextDecoration.underline
              ),
            ),
          ),
          Container(
            height: size.height * 0.4 + 20,
            width: size.width,
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TeamLead(size: size, desc: TeamLeadList[0]),
                TeamLead(size: size, desc: TeamLeadList[1]),
                TeamLead(size: size, desc: TeamLeadList[2])
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, top: 8),
            child: Text(
              'Support-Teachers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // decoration: TextDecoration.underline
              ),
            ),
          ),
          Container(
            height: size.height * 0.4 + 20,
            width: size.width,
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TeamLead(size: size, desc: TeamLeadList[0]),
                TeamLead(size: size, desc: TeamLeadList[1]),
                TeamLead(size: size, desc: TeamLeadList[2])
              ],
            ),
          ),
          Divider(
            indent: size.width * 0.1,
            endIndent: size.width * 0.1,
            color: Colors.grey,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                  side: BorderSide(
                      width: 2, color: Theme.of(context).primaryColor)),
              leading: Image.asset(
                'assets/images/quiksort.png',
                height: 40,
                width: 40,
                fit: BoxFit.contain,
              ),
              title: Text(
                'Quiksort.web',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,),),
                  trailing: Container(height: 40,width: 40,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                  side: BorderSide(
                      width: 2, color: Theme.of(context).primaryColor)),
              leading: Image.asset(
                'assets/images/insta.jpg',
                height: 40,
                width: 40,
                fit: BoxFit.contain,
              ),
              title: Text(
                'Instagram',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,),),
                  trailing: Container(height: 40,width: 40,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                  side: BorderSide(
                      width: 2, color: Theme.of(context).primaryColor)),
              leading: Image.asset(
                'assets/images/linkdin.jpg',
                height: 40,
                width: 40,
                fit: BoxFit.contain,
              ),
              title: Text(
                'Linkdin',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,),),
                  trailing: Container(height: 40,width: 40,),
            ),
          ),
          
        ],
      ),
    );
  }
}
