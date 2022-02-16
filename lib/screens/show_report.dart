import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scene/screens/create_report.dart';
import 'package:scene/screens/update_profile.dart';

import 'show_announcment.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var cartList = RefreshIndicator(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 4),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        SizedBox(
                          width: 100,
                          height: 80,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Card(
                                  color: Colors.white,
                                  elevation: 1,
                                  child: Column(children: [
                                    Center(
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/pothole.jpeg',
                                          height: 60,
                                          width: 60,
                                          // fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    )
                                  ]))),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "a fallen pole",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(
                                  Icons.verified,
                                  color: Colors.green,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "There is a fallen pole",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "- around this area",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ]),
                      // Divider(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 110),
                            child: Text(
                              "Arada",
                              style: TextStyle(color: Color(0xFF031437)),
                            ),
                          ),
                          // Spacer(),
                          SizedBox(
                            width: 70,
                          ),

                     
                          SizedBox(
                            width: 10,
                          ),

                          // Text("$count"),
                          SizedBox(
                            width: 10,
                          ),
                   
                        ],
                      ),
                    ],
                  ),
                  // ),
                ),
              ),
            );
          },
        ),
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {});
        });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reports",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        // iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 5),
            child: Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.announcement,
                      color: Color(0xFF031437),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnnouncmentScreen()));
                    }),

                InkWell(
                  child: CircleAvatar(
                    child: Image.asset("assets/images/ppcircle.png"),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyProfile()));
                  },
                ),

              
              ],
            ),
          )
        ],
      ),
      body: Container(
        // color: BHGreyColor.withOpacity(0.1),
        height: height,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Column(
                  children: <Widget>[cartList],
                ),
              ),
            ),
            Container(
              // color: Colors.white,
              // padding: const EdgeInsets.only(bottom: 0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: Color(0xFF031437),
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreatReport()));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
