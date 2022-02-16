import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scene/controller/announcement_controller.dart';

class AnnouncmentScreen extends GetView {
  final AnnouncementController controller = Get.put(AnnouncementController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var cartList = RefreshIndicator(
        child: controller.obx((state) => ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.length,
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
                                  width: 130,
                                  child: Text(
                                    state[index].title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                SizedBox(
                                    width: 200,
                                    child: Text(
                                      state[index].description,
                                      style: TextStyle(color: Colors.grey),
                                    )),
                                // Text(
                                //   "- around this area",
                                //   style: TextStyle(color: Colors.grey),
                                // ),
                              ],
                            ),
                          ]),
                          // Divider(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 110),
                                child: Text(
                                  state[index].postedAt.toString(),
                                  style: TextStyle(color: Color(0xFF031437)),
                                ),
                              ),
                              // Spacer(),
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
            )),
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
