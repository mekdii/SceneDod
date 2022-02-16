import 'package:flutter/material.dart';

import 'show_report.dart';

class FullName extends StatelessWidget {
  final String user;
  FullName({Key key, this.user}) : super(key: key);
  final Map<String, dynamic> _user = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF031437),
        actions: [
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
             
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              })
        ],
      ),
      body: Column(
        children: [
          TextFormField(
              maxLength: 20,
              initialValue: user,
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
                this._user['userName'] = val;
              }),
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
