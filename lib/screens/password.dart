import 'package:flutter/material.dart';
import 'package:scene/screens/show_report.dart';

class Password extends StatelessWidget {
  final String user;
  Password({Key key, this.user}) : super(key: key);
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
                // _saveusername(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              })
        ],
      ),
      body: Column(
        children: [
          TextFormField(
              initialValue: user,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                //hintText: 'discreption about the user?',
                labelText: 'Password *',
              ),
              validator: (val) {
                if (val.isEmpty) {
                  return 'Please insert new password';
                }
                return null;
              },
              onChanged: (val) {
                this._user['email'] = val;
              }),
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
                "you can use any valid password here but mind this will cause you change the login credentials that you have entered. \n\n a valid passworrd has atleast more than 4 characters.    ",
                style: TextStyle(
                  color: Colors.grey,
                )),
          ),
        ],
      ),
    );
  }

  // void _saveusername(BuildContext context) {
 

  // }
}
