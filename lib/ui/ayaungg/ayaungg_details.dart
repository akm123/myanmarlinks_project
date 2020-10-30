import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:htay_ayaung/database/ayaungg_db.dart';

import 'package:htay_ayaung/model/ayaungg.dart';

import 'package:htay_ayaung/ui/screen_size_helper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';

// import 'package:pattern_formatter/pattern_formatter.dart';
// import 'package:moneytextformfield/moneytextformfield.dart';

class AyaunggDetail extends StatefulWidget {
  final String appBarTitle;
  final Ayaungg ayaungg;

  AyaunggDetail(this.ayaungg, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return AyaunggDetailState(this.ayaungg, this.appBarTitle);
  }
}

class AyaunggDetailState extends State<AyaunggDetail> {
  bool imagetest = true;
  File imageFile;
  int amoney = 0;
  double dmoney = 0;
  int tmoney = 0;
  int kmmoney = 0;
  int tlmoney = 0;
  double cmoney = 0;
  double olmoney = 0;
  double sSize = 0.075;
  double sWidth = 0.145;
  double textSize = 0.043;
  // double desSize = 0.2;
  DatabaseHelper helper = DatabaseHelper();
  String appBarTitle;
  Ayaungg ayaungg;
  bool isEdited = false;
  bool _nameValidate = true;

  bool _numberValidate = true;
  bool _dateValidate = true;
  bool _amountValidate = true;

  AyaunggDetailState(this.ayaungg, this.appBarTitle);

  TextEditingController nameCtl = TextEditingController();
  TextEditingController numberCtl = TextEditingController();
  TextEditingController itemCtl = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController kyatCtl = TextEditingController();
  TextEditingController palCtl = TextEditingController();
  TextEditingController ywayCtl = TextEditingController();
  TextEditingController amountCtl = TextEditingController();
  TextEditingController desCtl = TextEditingController();
  TextEditingController imgurlsCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameCtl.text = ayaungg.name;
    numberCtl.text = ayaungg.number;

    itemCtl.text = ayaungg.item;
    dateCtl.text = ayaungg.date;
    kyatCtl.text = ayaungg.kyat;
    palCtl.text = ayaungg.pal;
    ywayCtl.text = ayaungg.yway;
    amountCtl.text = ayaungg.amount;
    desCtl.text = ayaungg.des;
    imgurlsCtl.text = ayaungg.imgurls;

    return WillPopScope(
      onWillPop: () {
        isEdited ? showDiscardDialog(context) : moveToLastScreen();
      },
      child: Scaffold(
        //backgroundColor: Colors.cyanAccent,
        appBar: AppBar(
          title: Text(appBarTitle),
          // backgroundColor: Colors.pink,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              isEdited ? showDiscardDialog(context) : moveToLastScreen();
            },
          ),

          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.save_alt,
                color: Colors.black,
                size: 30.0,
              ),
              padding: EdgeInsets.only(right: 20.0),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('What is your Lucky Number'),
                        content: Container(
                          height: 220.0,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: displayWidth(context) * sWidth,
                                    // padding: EdgeInsets.only(right: 7.0),
                                    child: Text(
                                      'နေရပ်',
                                      style: TextStyle(
                                          fontSize:
                                              displayWidth(context) * textSize),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      // controller: phoneController,
                                      showCursor: false,
                                      readOnly: true,
                                      keyboardType: TextInputType.phone,
                                      // inputFormatters: [ThousandsFormatter()],
                                      decoration: InputDecoration(
                                        hintText: numberCtl.text,
                                        hintStyle: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.redAccent),
                                        contentPadding:
                                            new EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 10.0),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.5, bottom: 3.5),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: displayWidth(context) * sWidth,
                                    // padding: EdgeInsets.only(right: 7.0),
                                    child: Text(
                                      'နေရပ်',
                                      style: TextStyle(
                                          fontSize:
                                              displayWidth(context) * textSize),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      // controller: phoneController,
                                      showCursor: false,
                                      readOnly: true,
                                      keyboardType: TextInputType.phone,
                                      // inputFormatters: [ThousandsFormatter()],
                                      decoration: InputDecoration(
                                        hintText: numberCtl.text,
                                        hintStyle: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.redAccent),
                                        contentPadding:
                                            new EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 10.0),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.5, bottom: 3.5),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: displayWidth(context) * sWidth,
                                    // padding: EdgeInsets.only(right: 7.0),
                                    child: Text(
                                      'နေရပ်',
                                      style: TextStyle(
                                          fontSize:
                                              displayWidth(context) * textSize),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      // controller: phoneController,
                                      showCursor: false,
                                      readOnly: true,
                                      keyboardType: TextInputType.phone,
                                      // inputFormatters: [ThousandsFormatter()],
                                      decoration: InputDecoration(
                                        hintText: numberCtl.text,
                                        hintStyle: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.redAccent),
                                        contentPadding:
                                            new EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 10.0),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.5, bottom: 3.5),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: displayWidth(context) * sWidth,
                                    // padding: EdgeInsets.only(right: 7.0),
                                    child: Text(
                                      'နေရပ်',
                                      style: TextStyle(
                                          fontSize:
                                              displayWidth(context) * textSize),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      // controller: phoneController,
                                      showCursor: false,
                                      readOnly: true,
                                      keyboardType: TextInputType.phone,
                                      // inputFormatters: [ThousandsFormatter()],
                                      decoration: InputDecoration(
                                        hintText: numberCtl.text,
                                        hintStyle: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.redAccent),
                                        contentPadding:
                                            new EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 10.0),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text('Submit'),
                            onPressed: () {
                              // akm = ayaungg.number.toString();
                              // print(akm);
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => Home()));
                            },
                          )
                        ],
                      );
                    });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.save,
                color: Colors.black,
                size: 30.0,
              ),
              padding: EdgeInsets.only(right: 20.0),
              onPressed: () {
                setState(() {
                  if (imageFile == null) {
                    Fluttertoast.showToast(
                        msg: "Please select an image",
                        gravity: ToastGravity.CENTER,
                        toastLength: Toast.LENGTH_LONG,
                        timeInSecForIosWeb: 2);
                  } else {
                    nameCtl.text.isEmpty
                        ? _nameValidate = false
                        : _nameValidate = true;

                    dateCtl.text.isEmpty
                        ? _dateValidate = false
                        : _dateValidate = true;
                    amountCtl.text.isEmpty
                        ? _amountValidate = false
                        : _amountValidate = true;
                    numberCtl.text.isEmpty
                        ? _numberValidate = false
                        : _numberValidate = true;
                    if (_nameValidate == true &&
                        _dateValidate == true &&
                        _amountValidate == true &&
                        _numberValidate == true) {
                      _save();
                    }
                  }
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.black,
                size: 30.0,
              ),
              onPressed: () {
                showDeleteDialog(context);
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          // child: Card(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(15.0),
          //   ),
          child: ListView(
            children: <Widget>[
              // Name Element

              Container(
                  height: displayHeight(context) * 0.19,
                  child:
                      // imagetest == true
                      //     ? Image.file(
                      //         imageFile,
                      //         width: 200,
                      //         height: 100,
                      //       )
                      //     :
                      Image.network(
                    imgurlsCtl.text,
                    width: 200,
                    height: 100,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                
                  FlatButton(
                      onPressed: () {
                        _showDialog();
                        
                      },
                      child: Icon(
                        Icons.add_a_photo,
                        size: 40,
                        color: Color(0xffff2fc3),
                      )),
                  RaisedButton(
                    child: Text('upload'),
                    onPressed: () {
                      upload();
                      updateImgurls();
                      setState(() {
                        imagetest = false;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(
                height: displayHeight(context) * sSize,
                // padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: displayWidth(context) * sWidth,
                      //padding: EdgeInsets.only(right: 1.0),
                      child: Text(
                        'အမည်',
                        style: TextStyle(
                            fontSize: displayWidth(context) * textSize),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: nameCtl,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          // labelText: 'အမည်',
                          // labelStyle: TextStyle(
                          //     fontWeight: FontWeight.bold, fontSize: 20.0),
                          errorText: _nameValidate == true
                              ? null
                              : 'Name Can\'t Be Empty',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (value) {
                          isEdited = true;
                          updateName();
                          //
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
              ),
              // Third Element
//Number Element
              SizedBox(
                height: displayHeight(context) * sSize,
                //  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: displayWidth(context) * sWidth,
                      //  padding: EdgeInsets.only(right: 6.0),
                      child: Text(
                        'နံပါတ်',
                        style: TextStyle(
                            fontSize: displayWidth(context) * textSize),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: numberCtl,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          //  labelText: 'နံပါတ်',
                          // labelStyle: TextStyle(
                          //     fontWeight: FontWeight.bold, fontSize: 20.0),
                          errorText: _numberValidate == true
                              ? null
                              : 'Number Can\'t Be Empty',
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (value) {
                          isEdited = true;
                          updateNum();
                        },
                      ),
                    ),
                  ],
                ),
              ),

//Date Element
              Padding(
                padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
              ),

              SizedBox(
                height: displayHeight(context) * sSize,
                // padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: displayWidth(context) * sWidth,
                      //  padding: EdgeInsets.only(right: 20.0),
                      //  child: Center(
                      child: Text(
                        'နေ့စွဲ',
                        style: TextStyle(
                            fontSize: displayWidth(context) * textSize),
                        //    ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: dateCtl,
                        showCursor: true,
                        readOnly: true,
                        onChanged: (value) {
                          isEdited = true;
                          updateDate();
                        },
                        decoration: InputDecoration(
                          // labelText: "နေ့စွဲ",
                          // labelStyle: TextStyle(
                          //     fontWeight: FontWeight.bold, fontSize: 20.0),
                          errorText: _dateValidate == true
                              ? null
                              : 'Date Can\'t Be Empty',
                          // hintText: "Date",
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onTap: () async {
                          DateTime ddate = DateTime(1900);
                          //  FocusScope.of(context).requestFocus(new FocusNode());
                          FocusManager.instance.primaryFocus.unfocus();
                          ddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );

                          final df = DateFormat('yyyy-MM-dd');
                          final fdate = df.format(ddate);
                          // print(fdate);
                          dateCtl.text = fdate;

                          updateDate();
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
              ),
//item Element
              SizedBox(
                height: displayHeight(context) * sSize,
                //padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: displayWidth(context) * sWidth,
                      //   padding: EdgeInsets.only(right: 1.0),
                      child: Text(
                        'ပစ္စည်း',
                        style: TextStyle(
                            fontSize: displayWidth(context) * textSize),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: itemCtl,
                        // keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          // labelText: 'ပစ္စည်း',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (value) {
                          isEdited = true;
                          updateItem();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
              ),
//Kyat Element
              SizedBox(
                height: displayHeight(context) * sSize,
                // padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: displayWidth(context) * sWidth,
                      //   padding: EdgeInsets.only(right: 17.0),
                      child: Text(
                        'ကျပ်',
                        style: TextStyle(
                            fontSize: displayWidth(context) * textSize),
                      ),
                    ),
                    Expanded(
                      // padding: EdgeInsets.only(top: 10.0),
                      child: TextField(
                        controller: kyatCtl,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          //  labelText: 'ကျပ်',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (value) {
                          isEdited = true;
                          updateKyat();
                        },
                      ),
                    ),
                    Container(
                      width: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Text(
                        'ပဲ',
                        style: TextStyle(
                            fontSize: displayWidth(context) * textSize),
                      ),
                    ),
                    Expanded(
                      //padding: EdgeInsets.only(top: 10.0),
                      child: TextField(
                        controller: palCtl,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          //  labelText: 'ပဲ',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (value) {
                          isEdited = true;
                          updatePal();
                        },
                      ),
                    ),
                    Container(
                      width: 15.0,
                    ),
                    (Padding(
                      padding: EdgeInsets.only(right: 10.0, left: 5.0),
                      child: Text(
                        'ရွေး',
                        style: TextStyle(
                            fontSize: displayWidth(context) * textSize),
                      ),
                    )),
                    Expanded(
                      // padding: EdgeInsets.only(top: 10.0),
                      child: TextField(
                        controller: ywayCtl,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          //labelText: 'ရွေး',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (value) {
                          isEdited = true;
                          updateYway();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
              ),
              SizedBox(
                height: displayHeight(context) * sSize,
                //  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: displayWidth(context) * sWidth,
                      // padding: EdgeInsets.only(right: 8.0),
                      child: Text(
                        'ယူငွေ',
                        style: TextStyle(
                            fontSize: displayWidth(context) * textSize),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: amountCtl,
                        keyboardType: TextInputType.phone,
                        //  inputFormatters: [ThousandsFormatter()],
                        decoration: InputDecoration(
                          errorText: _amountValidate == true
                              ? null
                              : 'Amount Can\'t Be Empty',
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (value) {
                          isEdited = true;
                          updateAmount();
                          //
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                // height: displayHeight(context) * sSize,
                padding: EdgeInsets.only(top: 7.5, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: displayWidth(context) * sWidth,
                      //  padding: EdgeInsets.only(right: 1.0),
                      child: Text(
                        'မှတ်ချက်',
                        style:
                            TextStyle(fontSize: displayWidth(context) * 0.03),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: desCtl,
                        // keyboardType: TextInputType.phone,
                        maxLines: 2,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (value) {
                          isEdited = true;
                          updateDes();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            "Delete ayaungg?",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          content: Text(
            "Are you sure you want to delete this ayaungg?",
            style: TextStyle(fontSize: 20.0),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "No",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
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
                onPressed: () {
                  Navigator.of(context).pop();
                  _delete();
                }
                // color: Colors.redAccent,
                ),
          ],
        );
      },
    );
  }

  void showEmptyTitleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            "Title is empty!",
            style: TextStyle(fontSize: 25.0),
          ),
          content: Text(
            'The title of the ayaungg cannot be empty.',
            style: TextStyle(fontSize: 20.0),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Okay",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showDiscardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            "Discard Changes?",
            style: TextStyle(fontSize: 25.0),
          ),
          content: Text(
            "Are you sure you want to discard changes?",
            style: TextStyle(fontSize: 20.0),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "No",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                "Yes",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                moveToLastScreen();
              },
            ),
          ],
        );
      },
    );
  }

  void updateName() {
    isEdited = true;
    ayaungg.name = nameCtl.text;
  }

  void updateNum() {
    isEdited = true;
    ayaungg.number = numberCtl.text;
  }

 

  void updateItem() {
    isEdited = true;
    ayaungg.item = itemCtl.text;
  }

  void updateKyat() {
    isEdited = true;
    ayaungg.kyat = kyatCtl.text;
  }

  void updatePal() {
    isEdited = true;
    ayaungg.pal = palCtl.text;
  }

  void updateYway() {
    isEdited = true;
    ayaungg.yway = ywayCtl.text;
  }

  void updateAmount() {
    isEdited = true;
    ayaungg.amount = amountCtl.text;
  }

  void updateDes() {
    isEdited = true;
    ayaungg.des = desCtl.text;
  }

  void updateDate() {
    isEdited = true;
    ayaungg.date = dateCtl.text;
  }

  void updateImgurls() {
    imagetest = true;
    isEdited = true;
    ayaungg.imgurls = imgurlsCtl.text;
  }

  void _save() async {
    // StorageReference reference = FirebaseStorage.instance
    //     .ref()
    //     .child("images")
    //     .child(new DateTime.now().millisecondsSinceEpoch.toString() +
    //         "." +
    //         imageFile.path);
    // StorageUploadTask uploadTask = reference.putFile(imageFile);

    // var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    // String url = imageUrl.toString();
    // ayaungg.imgurls = url;
    moveToLastScreen();
    //     akm = ayaungg.number.toString();
    // print(akm);
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => Home(akm)));

    //ayaungg.date = dateCtl.text;
    //ayaungg.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (ayaungg.id != null) {
      result = await helper.updateAyaungg(ayaungg);
    } else {
      result = await helper.insertAyaungg(ayaungg);
    }

    if (result != 0) {
      _showAlertDialog("Status", "ayaungg Saved Successfully");
    } else {
      _showAlertDialog("Status", "Problem In Saving ayaungg");
    }
  }

  void _delete() async {
    moveToLastScreen();

    if (ayaungg.id == null) {
      _showAlertDialog("Status", "First Add a ayaungg");
      return;
    }
    int result = await helper.deleteAyaungg(ayaungg.id);

    if (result != 0) {
      _showAlertDialog("Status", "ayaungg Deleted Successfully");
    } else {
      _showAlertDialog("Status", "Sorry, Error");
    }
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void _showAlertDialog(String title, String message) {
    CupertinoAlertDialog alertDialog = CupertinoAlertDialog(
      title: Text(
        title,
        style: TextStyle(fontSize: 25.0),
      ),
      content: Text(
        message,
        style: TextStyle(fontSize: 20.0),
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  Future<void> _showDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: Text("You want take a photo from ?"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallary"),
                    onTap: () {
                      openGallary();
                      Navigator.pop(context, true);
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      openCamera();
                      Navigator.pop(context, true);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> openGallary() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
  }

  Future<void> openCamera() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
  }

  Future<void> upload() async {
    StorageReference reference = FirebaseStorage.instance
        .ref()
        .child("images")
        .child(new DateTime.now().millisecondsSinceEpoch.toString() +
            "." +
            imageFile.path);
    StorageUploadTask uploadTask = reference.putFile(imageFile);

    var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String url = imageUrl.toString();

    imgurlsCtl.text = url;
    ayaungg.imgurls = imgurlsCtl.text;
  }
}
