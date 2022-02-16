import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class BHRegistrationScreen extends StatefulWidget {
  @override
  NewRegistrationScreenState createState() => NewRegistrationScreenState();
}

class NewRegistrationScreenState extends State<BHRegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _showPassword = false;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController fullNameCont = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController addressCont = TextEditingController();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode dobFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    fullNameFocusNode.dispose();
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    dobFocusNode.dispose();
    addressFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFF031437),
          body: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset('assets/images/fix.png')
                    // SvgPicture.asset(BHAppLogo, color: white.withOpacity(0.8), height: 150, width: 150),
                    ),
              ),
              Container(
                margin: EdgeInsets.only(top: 200),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  color: Colors.white,
                ),
                child: Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: fullNameCont,
                          focusNode: fullNameFocusNode,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(passwordFocusNode);
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF031437))),
                            labelText: "Full Name",
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          validator: validateName,
                        ),
                        TextFormField(
                          controller: passwordCont,
                          focusNode: passwordFocusNode,
                          obscureText: !_showPassword,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 14),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(0xFF031437),
                                  size: 20),
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                          validator: (_) {
                            return phoneNumber.text.isNotEmpty
                                ? null
                                : 'please provide password';
                          },
                        ),
                        TextFormField(
                          controller: emailCont,
                          focusNode: emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(dobFocusNode);
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF031437))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF031437))),
                            labelText: "Username",
                            labelStyle:
                                TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          // validator: validateEmail,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(12),
                              primary: Color(0xFF031437),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            onPressed: () {
                              _validateInputs();
                              // _onFormSubmitted();
                              // finish(context);
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BHLoginScreen()));
                              // finish(context);
                            },
                            child: Text.rich(
                              TextSpan(
                                text: "already have account?",
                                style: TextStyle(color: Colors.grey),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "sign in",
                                      style:
                                          TextStyle(color: Color(0xFF031437)))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BackButton(color: Colors.white),
            ],
          )),
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _onFormSubmitted();
      // _formKey.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String validateMobile(String value) {
    if (value.length != 9)
      return 'Mobile Number must be of 9 digit';
    else
      return null;
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  void _onFormSubmitted() {}
}
