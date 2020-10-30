import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htay_ayaung/database/apaung_db.dart';

import 'package:htay_ayaung/model/apaung.dart';

import 'package:htay_ayaung/ui/screen_size_helper.dart';

import 'package:intl/intl.dart';

// import 'package:pattern_formatter/pattern_formatter.dart';
// import 'package:moneytextformfield/moneytextformfield.dart';

class ApaungDetail extends StatefulWidget {
  final String appBarTitle;
  final Apaung apaung;

  ApaungDetail(this.apaung, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return ApaungDetailState(this.apaung, this.appBarTitle);
  }
}

class ApaungDetailState extends State<ApaungDetail> {
 
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
  Apaung apaung;
  bool isEdited = false;
  bool _nameValidate = true;
  bool _homeValidate = true;
  bool _numberValidate = true;
  bool _dateValidate = true;
  bool _amountValidate = true;

  ApaungDetailState(this.apaung, this.appBarTitle);

  TextEditingController nameCtl = TextEditingController();
  TextEditingController numberCtl = TextEditingController();
  TextEditingController homeCtl = TextEditingController();
  TextEditingController itemCtl = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController kyatCtl = TextEditingController();
  TextEditingController palCtl = TextEditingController();
  TextEditingController ywayCtl = TextEditingController();
  TextEditingController amountCtl = TextEditingController();
  TextEditingController desCtl = TextEditingController();
  TextEditingController rateCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameCtl.text = apaung.name;
    numberCtl.text = apaung.number;
    homeCtl.text = apaung.home;
    itemCtl.text = apaung.item;
    dateCtl.text = apaung.date;
    kyatCtl.text = apaung.kyat;
    palCtl.text = apaung.pal;
    ywayCtl.text = apaung.yway;
    amountCtl.text = apaung.amount;
    desCtl.text = apaung.des;
    rateCtl.text = apaung.rate;

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
                              // akm = apaung.number.toString();
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
                  nameCtl.text.isEmpty
                      ? _nameValidate = false
                      : _nameValidate = true;
                  homeCtl.text.isEmpty
                      ? _homeValidate = false
                      : _homeValidate = true;
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
                      _homeValidate == true &&
                      _dateValidate == true &&
                      _amountValidate == true &&
                      _numberValidate == true) {
                    _save();
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
              SizedBox(
                height: displayHeight(context) * sSize,
                // padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: displayWidth(context) * sWidth,
                      // padding: EdgeInsets.only(right: 7.0),
                      child: Text(
                        'နေရပ်',
                        style: TextStyle(
                            fontSize: displayWidth(context) * textSize),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: homeCtl,
                        // keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          // labelText: 'နေရပ်',
                          // labelStyle: TextStyle(
                          //     fontWeight: FontWeight.bold, fontSize: 20.0),

                          errorText: _homeValidate == true
                              ? null
                              : 'Home Can\'t Be Empty',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (value) {
                          isEdited = true;
                          updateHome();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
              ),
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
                padding: EdgeInsets.only(top: 2.5, bottom: 2.5),
              ),
              SizedBox(
                height: displayHeight(context) * sSize,
                //  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: displayWidth(context) * sWidth,
                      // padding: EdgeInsets.only(right: 27.0),
                      //   child: Center(
                      child: Text(
                        'နှုန်း',
                        style: TextStyle(
                            fontSize: displayWidth(context) * textSize),
                      ),
                      //  ),
                    ),
                    SizedBox(
                      width: 60.0,
                      child: TextField(
                        controller: rateCtl,
                        keyboardType: TextInputType.phone,
                        //  inputFormatters: [ThousandsFormatter()],
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (value) {
                          isEdited = true;
                          updateRate();
                          //
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 1.0, left: 10.0),
                      child: Text(
                        'တစ်လတိုး',
                        style: TextStyle(
                            fontSize: displayWidth(context) * textSize),
                      ),
                    ),
                    Expanded(
                      //padding: EdgeInsets.only(top: 10.0),
                      child: TextField(
                        // controller: phoneController,
                        showCursor: true,
                        readOnly: true,
                        keyboardType: TextInputType.phone,
                        // inputFormatters: [ThousandsFormatter()],
                        decoration: InputDecoration(
                          hintText: tlmoney.toString(),
                          hintStyle: TextStyle(
                              fontSize: 20.0, color: Colors.redAccent),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (value) {},
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
                //  padding: EdgeInsets.only(bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: displayWidth(context) * sWidth,
                      //  padding: EdgeInsets.only(right: 9.0),
                      child: Text(
                        'အတိုး',
                        style: TextStyle(
                            fontSize: displayWidth(context) * textSize),
                      ),
                    ),
                    Expanded(
                      // padding: EdgeInsets.only(top: 10.0),
                      child: TextFormField(
                        // controller: phoneController,
                        //  keyboardType: TextInputType.phone,
                        // initialValue: cmoney.toString(),
                        // showCursor: true,
                        showCursor: true,
                        readOnly: true,
                        // inputFormatters: [ThousandsFormatter()],
                        decoration: InputDecoration(
                          hintText: kmmoney.toString(),

                          hintStyle: TextStyle(
                              fontSize: 20.0, color: Colors.redAccent),
                          // labelText: 'Kyat',
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (value) {
                          //
                        },
                      ),
                    ),
                    Container(
                      width: 15.0,
                    ),
                    // Expanded(
                    //padding: EdgeInsets.only(top: 10.0),
                    SizedBox(
                      width: 120.0,
                      height: 50.0,
                      child: RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        //  padding: EdgeInsets.all(10.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {
                          // amoney = int.parse(value);
                          amoney = int.parse(amountCtl.text);
                          dmoney = double.parse(rateCtl.text);
                          // if (amoney >= 1000000) {
                          //   dmoney = 1.5;
                          // } else if (amoney < 1000000) {
                          //   dmoney = 2;
                          // }
                          //  print(amoney);

                          final ffdate = dateCtl.text;
                          //print(ffdate);
                          final tdate = DateTime.now();
                          //   print(tdate);
                          final bdate = DateTime.parse(ffdate);
                          final dfdate = tdate.difference(bdate).inDays;
                          tmoney = dfdate;
                          print(tmoney);

                          cmoney = ((tmoney / 30) * (amoney * dmoney)) / 100;
                          kmmoney = cmoney.toInt();

                          olmoney = (amoney * dmoney) / 100;
                          print(olmoney);
                          tlmoney = olmoney.toInt();

                          setState(() {});
                          // return cmoney;
                          // print(amoney);
                          // print(tmoney);
                          // print(dmoney);
                          //   print(cmoney);
                        },
                        child: Text(
                          "Calculate",
                          style: TextStyle(
                              fontSize: displayWidth(context) * textSize),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                // height: displayHeight(context) * sSize,
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
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
                        maxLines: 3,
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
            "Delete apaung?",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          content: Text(
            "Are you sure you want to delete this apaung?",
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
            'The title of the apaung cannot be empty.',
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
    apaung.name = nameCtl.text;
  }

  void updateNum() {
    isEdited = true;
    apaung.number = numberCtl.text;
  }

  void updateHome() {
    isEdited = true;
    apaung.home = homeCtl.text;
  }

  void updateItem() {
    isEdited = true;
    apaung.item = itemCtl.text;
  }

  void updateKyat() {
    isEdited = true;
    apaung.kyat = kyatCtl.text;
  }

  void updatePal() {
    isEdited = true;
    apaung.pal = palCtl.text;
  }

  void updateYway() {
    isEdited = true;
    apaung.yway = ywayCtl.text;
  }

  void updateAmount() {
    isEdited = true;
    apaung.amount = amountCtl.text;
  }

  void updateDes() {
    isEdited = true;
    apaung.des = desCtl.text;
  }

  void updateDate() {
    isEdited = true;
    apaung.date = dateCtl.text;
  }

  void updateRate() {
    isEdited = true;
    apaung.rate = rateCtl.text;
  }

  void _save() async {
     moveToLastScreen();
    //     akm = apaung.number.toString();
    // print(akm);
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => Home(akm)));
       
     
    //apaung.date = dateCtl.text;
    //apaung.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (apaung.id != null) {
      result = await helper.updateApaung(apaung);
    } else {
      result = await helper.insertApaung(apaung);
    }

    if (result != 0) {
      _showAlertDialog("Status", "apaung Saved Successfully");
    } else {
      _showAlertDialog("Status", "Problem In Saving apaung");
    }

  }

  void _delete() async {
    moveToLastScreen();

    if (apaung.id == null) {
      _showAlertDialog("Status", "First Add a apaung");
      return;
    }
    int result = await helper.deleteApaung(apaung.id);

    if (result != 0) {
      _showAlertDialog("Status", "apaung Deleted Successfully");
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
}
