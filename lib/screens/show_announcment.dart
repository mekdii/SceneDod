import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnnouncmentScreen extends StatefulWidget {
  @override
  AnnouncmentScreenState createState() => AnnouncmentScreenState();
}

class AnnouncmentScreenState extends State<AnnouncmentScreen> {
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
                                          'assets/images/au.jpeg',
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
                            SizedBox(
                              width: 230,
                              child: Text(
                                "Au Meeting",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "There will be a meeting \n tomorow and roads will be closed ",
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
                              "17/4/2022",
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
                      SizedBox(
                        height: 10,
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
          "Announcment",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
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
            
          ],
        ),
      ),
    );
  }
}
