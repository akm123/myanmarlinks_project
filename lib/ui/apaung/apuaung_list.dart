import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htay_ayaung/database/apaung_db.dart';
import 'package:htay_ayaung/model/apaung.dart';
import 'package:htay_ayaung/ui/apaung/apaung_detials.dart';
import 'package:htay_ayaung/ui/apaung/search_apaung.dart';
import 'package:htay_ayaung/ui/screen_size_helper.dart';
import 'dart:async';



class ApaungList extends StatefulWidget {
  @override
  _ApaungListState createState() => _ApaungListState();
}

class _ApaungListState extends State<ApaungList> {
  double nameSize = 0.32;
  double homeSize = 0.28;
  double noSize = 0.15;
  double amountSize = 0.25;

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Apaung> apaungds;
  // List<apaung> apaungList;
  //int count = 0;
  // Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Htay');

  void navigateToDetail(Apaung apaung, String title) async {
    //bool result =
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ApaungDetail(apaung, title);
        },
      ),
    );

  }



  @override
  Widget build(BuildContext context) {
    // if (apaungList == null) {
    apaungds = List<Apaung>();
    //  // updateListView();
    // }
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

    // TODO: implement build
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: _appBarTitle,
            leading: new IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              //  moveToLastScreen();
              },
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      // color: Colors.black,
                    ),
                    onPressed: () async {
                      //               Navigator.push(context, MaterialPageRoute(builder: (context) {
                      // return CloudFirestoreSearch();

                      final Apaung result = await showSearch(
                          context: context,
                          delegate: ApaungsSearch(apaungs: apaungds));
                      if (result != null) {
                        navigateToDetail(result, 'Edit Apaung');
                      }

                      //  },
                      //  ),
                      //  );
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    navigateToDetail(Apaung(), "Add Apaung");
                  },
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 35.0,
                  ),
                ),
              ),
            ],
          ),
          body: Container(
            child: Column(
              //padding: const EdgeInsets.all(8.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(4.0),
                ),
                Container(
                    //   padding: EdgeInsets.only( bottom: 2.0, left: 5.0, right: 5.0),
                    height: 40.0,
                    child: ListView(
                      // shrinkWrap: true,
                      // padding: const EdgeInsets.only(top:10.0),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 0.8,
                            ),
                          ),
                          width: displayWidth(context) * nameSize,
                          child: Center(
                            child: Text(
                              'အမည်',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                //  fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 0.8,
                            ),
                          ),
                          width: displayWidth(context) * homeSize,
                          child: Center(
                            child: Text(
                              'နေရပ်',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                // fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          width: displayWidth(context) * noSize,
                          child: Center(
                            child: Text(
                              'နံပါတ်',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                // fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          width: displayWidth(context) * amountSize,
                          child: Center(
                            child: Text(
                              'ယူငွေ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                // Container(
                //  child: costListView(),
                // ),
                Expanded(
                  child: getApaungListView(),
                )
              ],
            ),
          )
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: Colors.purple,
          //   child: Icon(Icons.add),
          //   onPressed: () {
          //     navigateToDetail(
          //         Apaung('', '', '', '', '', '', '', '', '', ''), "Add Apaung");
          //   },
          // ),
          ),
    );
  }

  getApaungListView() {
    return StreamBuilder<List<Apaung>>(
        stream: databaseHelper.getAllApaungs(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          apaungds = snapshot.data;
          return ListView.builder(
            // shrinkWrap: true,
            itemCount: apaungds.length,
            itemBuilder: (context, index) {
              //  final apaung apaungd = apaungds[index];
              return Container(
                //  padding: EdgeInsets.only(top: 2.0,bottom: 2.0,left: 5.0 ,right: 5.0),
                // margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 40.0,
                child: InkWell(
                  onLongPress: () async {
                    navigateToDetail(apaungds[index], "Edit Todo");
                  },
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.8,
                          ),
                        ),
                        width: displayWidth(context) * nameSize,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              apaungds[index].name ?? '',
                              style: TextStyle(
                                fontSize: 15.0,
                                //fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.8,
                          ),
                        ),
                        width: displayWidth(context) * homeSize,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              //  this.apaungList[index].home,
                              apaungds[index].home ?? '',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.8,
                          ),
                        ),
                        width: displayWidth(context) * noSize,
                        child: Center(
                          child: Text(
                            // this.apaungList[index].number,
                            apaungds[index].number ?? '',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.8,
                          ),
                        ),
                        width: displayWidth(context) * amountSize,
                        padding: EdgeInsets.only(right: 2.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            //this.apaungList[index].amount,
                            apaungds[index].amount ?? '',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
