import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:htay_ayaung/database/ayaungg_db.dart';
import 'package:htay_ayaung/model/ayaungg.dart';
import 'package:htay_ayaung/ui/ayaungg/ayaungg_details.dart';
import 'package:htay_ayaung/ui/ayaungg/search_ayaungg.dart';

import 'package:htay_ayaung/ui/screen_size_helper.dart';
import 'dart:async';

class AyaunggList extends StatefulWidget {
  @override
  _AyaunggListState createState() => _AyaunggListState();
}

class _AyaunggListState extends State<AyaunggList> {
  double nameSize = 0.32;
  double homeSize = 0.28;
  double noSize = 0.15;
  double amountSize = 0.25;
  int axisCount = 2;

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Ayaungg> ayaunggds;
  // List<ayaungg> ayaunggList;
  //int count = 0;
  // Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Htay');

  void navigateToDetail(Ayaungg ayaungg, String title) async {
    //bool result =
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AyaunggDetail(ayaungg, title);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // if (ayaunggList == null) {
    ayaunggds = List<Ayaungg>();
    //  // updateListView();
    // }
    Future<bool> _onBackPressed() {
      return showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text("Do You Really Want To Exit?"),
          //  content: Text("Are you sure you want to delete this ayaungg?",
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
            backgroundColor: Colors.blueGrey[400],
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
                      axisCount == 2 ? Icons.list : Icons.grid_on,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        axisCount = axisCount == 2 ? 4 : 2;
                      });
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      // color: Colors.black,
                    ),
                    onPressed: () async {
                      final Ayaungg result = await showSearch(
                          context: context,
                          delegate: AyaunggsSearch(ayaunggs: ayaunggds));
                      if (result != null) {
                        navigateToDetail(result, 'Edit Ayaungg');
                      }
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    navigateToDetail(Ayaungg(), "Add Ayaungg");
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
                Expanded(
                  child: getAyaunggListView(),
                )
              ],
            ),
          )
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: Colors.purple,
          //   child: Icon(Icons.add),
          //   onPressed: () {
          //     navigateToDetail(
          //         Ayaungg('', '', '', '', '', '', '', '', '', ''), "Add Ayaungg");
          //   },
          // ),
          ),
    );
  }

  getAyaunggListView() {
    return StreamBuilder<List<Ayaungg>>(
        stream: databaseHelper.getAllAyaunggs(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          ayaunggds = snapshot.data;
          return StaggeredGridView.countBuilder(
            physics: BouncingScrollPhysics(),
            crossAxisCount: 4,
            itemCount: ayaunggds.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                navigateToDetail(this.ayaunggds[index], 'Edit Ayaungg');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      //  color: colors[this.noteList[index].color],
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.network(
                          ayaunggds[index].imgurls ?? '',
                          width: 200.0,
                          height: 200.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(ayaunggds[index].name ?? ''),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(ayaunggds[index].number ?? ''),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            staggeredTileBuilder: (int index) => StaggeredTile.fit(axisCount),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          );
        });
  }
}
