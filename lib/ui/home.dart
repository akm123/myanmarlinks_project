import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:htay_ayaung/ui/apaung/apuaung_list.dart';
import 'package:htay_ayaung/ui/ayaungg/ayaungg_list.dart';
import 'package:htay_ayaung/ui/ayaungg/image_capture.dart';
import 'package:htay_ayaung/ui/screen_size_helper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
      return showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text("Do You Really Want To Exit?"),
          //  content: Text("Are you sure you want to delete this apaung?",
          actions: <Widget>[
            FlatButton(
              child: Text(
                "No",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => Navigator.pop(context, false),
              //  color: Colors.greenAccent,
            ),
            FlatButton(
              child: Text(
                "Yes",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => Navigator.pop(context, true),
              // color: Colors.redAccent,
            ),
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
           backgroundColor: Colors.grey,
          leading: Icon(Icons.add_box),
          title: Text('Htay'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.only(
                  top: displayHeight(context) * 0.325,
                  left: displayWidth(context) * 0.02),
              height: displayHeight(context) * 1,
              width: displayWidth(context) * 1,
              child: Stack(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Text(
                    'Detail Information',
                    style:
                        TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Positioned(
              top: displayHeight(context) * 0.37,
              bottom: displayHeight(context) * 0.28,
              left: displayWidth(context) * 0.02,
              right: displayWidth(context) * 0.52,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ApaungList(); //UploadingImageToFirebaseStorage
                      },
                    ),
                  );
                },
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(15.0),
                      ),
                      Icon(
                        Icons.book,
                        size: 50,
                        color: Colors.grey[900],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          "အပေါင်",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: displayHeight(context) * 0.37,
              bottom: displayHeight(context) * 0.28,
              left: displayWidth(context) * 0.52,
              right: displayWidth(context) * 0.02,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AyaunggList();
                      },
                    ),
                  );
                },
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(15.0),
                      ),
                      Icon(
                        Icons.collections_bookmark,
                        size: 50,
                        color: Colors.grey[900],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          "အရောင်း",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: displayHeight(context) * 0.62,
              bottom: displayHeight(context) * 0.02,
              left: displayWidth(context) * 0.02,
              right: displayWidth(context) * 0.52,
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return AyaunggList();
                  //     },
                  //   ),
                  // );
                },
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(15.0),
                      ),
                      Icon(
                        Icons.adb,
                        size: 50,
                        color: Colors.grey[900],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          "About",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: displayHeight(context) * 0.62,
              bottom: displayHeight(context) * 0.02,
              left: displayWidth(context) * 0.52,
              right: displayWidth(context) * 0.02,
              child: InkWell(
                onTap: () {
                  print('h5');
                },
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(15.0),
                      ),
                      Icon(
                        Icons.settings_applications,
                        size: 50,
                        color: Colors.grey[900],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          "Setting",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blueGrey[400],
              height: displayHeight(context) * 0.25,
              width: displayWidth(context) * 1,
              child: Padding(
                  padding: EdgeInsets.all(45),
                  child: Text(
                    'Total Amount is ',
                    style: TextStyle(
                      fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                    ),
                  )),
            ),
            Positioned(
              top: displayHeight(context) * 0.15,
              left: 10.0,
              right: 10.0,
              child: InkWell(
                onTap: () {
                  print('htay');
                },
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Good Finanical",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Statics"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
