import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:scene/controller/user_controller.dart';

import 'show_report.dart';

class FullName extends GetView {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final UserController controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF031437),
        actions: [
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () async {
                if (_key.currentState.validate()) {
                  controller.postChange();
                }
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              })
        ],
      ),
      body: Column(
        children: [
          Form(
            key: _key,
            child: TextFormField(
                maxLength: 20,
                initialValue: controller.username.value,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  //hintText: 'discreption about the user?',
                  labelText: 'fullname *',
                ),
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Please insert fullname';
                  }
                  return null;
                },
                onChanged: (val) {
                  print("...........VV.............." +
                      controller.username.value);
                  controller.username.value = val;
                }),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "you can choose a full name on this app so when ever you take some action your full name will be visibile in others account \n\n a valid full name can be any thing which can have less than 20 letters .    ",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  // void _saveusername(BuildContext context) {

  //   );

}
