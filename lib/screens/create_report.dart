import 'dart:io';

import 'package:flutter/material.dart';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CreatReport extends StatefulWidget {
 
  const CreatReport({Key key})
      : super(key: key);

  @override
  _CreatReportState createState() => _CreatReportState();
}

class _CreatReportState extends State<CreatReport> {
  final _formKey = GlobalKey<FormState>();
  final globalKey = GlobalKey<ScaffoldState>();
  File _image = null;
  bool isButtonActive = true;
  
  TextEditingController message = TextEditingController();
  TextEditingController amount = TextEditingController();

  Future<void> _cropImage(imageFile) async {
    if (imageFile == null) {
      return;
    }
    File cropped = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        ratioX: 4.0,
        ratioY: 3.0,
        // maxWidth: 512,
        // maxHeight: 512,
        toolbarColor: Colors.black87,
        toolbarWidgetColor: Colors.white,
        toolbarTitle: 'Crop It');

    setState(() {
      this._image = cropped ?? imageFile;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    if (selected == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("No image is selected"),
      ));
      return;
    }
    setState(() {
      _cropImage(selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: Text(
            "Create Report",
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: Container(
          height: 700,
          child: Form(
            key: _formKey,
            child: Container(
              height: 100,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey, // background
                                onPrimary: Colors.white,
                                minimumSize: Size(100, 50)
                                // foreground
                                ),
                            onPressed: () {},
                            child: Text(
                              'pothole',
                              style: TextStyle(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: TextFormField(
                          controller: message,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            hintText: 'Enter message ',
                            hintStyle:
                                TextStyle(fontSize: 14, fontFamily: 'raleway'),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF0EFEF),
                              ),
                            ),
                            isCollapsed: true,
                            contentPadding: EdgeInsets.all(9),
                            fillColor: Color(0xFFF0EFEF),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter message';
                            }
                            return null;
                          },

                          //double.parse(value),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      _image != null
                          ? Container(
                              margin: EdgeInsets.only(
                                  left: 100.0, right: 100.0, top: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12)),
                              child: Column(
                                children: [
                                  _image != null
                                      ? Container(
                                          // width: 60.0,
                                          child: Image.file(
                                          _image,
                                          width: 100,
                                        ))
                                      : Text(""),
                                ],
                              ),
                            )
                          : Text(""),
                      Center(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: IconButton(
                                icon: Icon(Icons.photo_camera,
                                    color: Colors.black45),
                                onPressed: () {
                                  _pickImage(ImageSource.camera);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(children: [
                        // if (isButtonActive == true)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFF031437), // background
                                onPrimary: Colors.white,
                                minimumSize: Size(100, 50)
                                // foreground
                                ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Submit',
                                  style: TextStyle(),
                                ),
                                Icon(Icons.arrow_forward)
                              ],
                            ),
                          ),
                        ),
                      ])
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
