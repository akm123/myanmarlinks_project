import 'package:flutter/material.dart';
import 'package:htay_ayaung/model/apaung.dart';




class ApaungsSearch extends SearchDelegate<Apaung> {
  final List<Apaung> apaungs;
  List<Apaung> filteredApaungs = [];
  ApaungsSearch({this.apaungs});

  // @override
  // ThemeData appBarTheme(BuildContext context) {
  //   assert(context != null);
  //   final ThemeData theme = Theme.of(context).copyWith(
  //       hintColor: Colors.black,
  //       primaryColor: Colors.white,
  //       textTheme: TextTheme(
  //         title: TextStyle(
  //             color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
  //       ));
  //   assert(theme != null);
  //   return theme;
  // }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Colors.black,
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query == '') {
      return Container(
        color: Colors.white,
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 50,
              child: Icon(
                Icons.search,
                size: 50,
                color: Colors.black,
              ),
            ),
            Text(
              'Enter a Apaung to search.',
              style: TextStyle(color: Colors.black),
            )
          ],
        )),
      );
    } else {
      filteredApaungs = [];
      getFilteredList(apaungs);
      if (filteredApaungs.length == 0) {
        return Container(
          color: Colors.white,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.sentiment_dissatisfied,
                  size: 50,
                  color: Colors.black,
                ),
              ),
              Text(
                'No results found',
                style: TextStyle(color: Colors.black),
              )
            ],
          )),
        );
      } else {
        return Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: filteredApaungs.length == null ? 0 : filteredApaungs.length,
            itemBuilder: (context, index) {
              return Container(
                //  padding: EdgeInsets.only(top: 2.0,bottom: 2.0,left: 5.0 ,right: 5.0),
                // margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 40.0,
                child: InkWell(
                  onTap: () {
                    close(context, filteredApaungs[index]);
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
                        width: 135.0,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            this.filteredApaungs[index].name ?? '',
                            style: TextStyle(
                              fontSize: 15.0,
                              //fontStyle: FontStyle.italic
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
                        width: 108.0,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            this.filteredApaungs[index].home ?? '',
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
                        width: 50.0,
                        child: Center(
                          child: Text(
                            this.filteredApaungs[index].number ?? '',
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
                        width: 100.0,
                        padding: EdgeInsets.only(right: 5.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            this.filteredApaungs[index].amount ?? '',
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
          ),
        );
      }
    }
  }

  List<Apaung> getFilteredList(List<Apaung> apaung) {
    for (int i = 0; i < apaung.length; i++) {
      if (apaung[i].name.toLowerCase().contains(query) ||
          apaung[i].home.toLowerCase().contains(query) ||
          apaung[i].number.toLowerCase().contains(query) ||
          apaung[i].date.toLowerCase().contains(query) ||
          apaung[i].amount.toLowerCase().contains(query) 
          ) {
        filteredApaungs.add(apaung[i]);
      }
    }
    return filteredApaungs;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') {
      return Container(
        color: Colors.white,
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 50,
              child: Icon(
                Icons.search,
                size: 50,
                color: Colors.black,
              ),
            ),
            Text(
              'Enter a Apaung to search.',
              style: TextStyle(color: Colors.black),
            )
          ],
        )),
      );
    } else {
      filteredApaungs = [];
      getFilteredList(apaungs);
      if (filteredApaungs.length == 0) {
        return Container(
          color: Colors.white,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.sentiment_dissatisfied,
                  size: 50,
                  color: Colors.black,
                ),
              ),
              Text(
                'No results found',
                style: TextStyle(color: Colors.black),
              )
            ],
          )),
        );
      } else {
        return Container(
          padding: EdgeInsets.only(top: 10.0),
          color: Colors.white,
          child: ListView.builder(
            itemCount: filteredApaungs.length == null ? 0 : filteredApaungs.length,
            itemBuilder: (context, index) {
              return Container(
                //  padding: EdgeInsets.only(top: 2.0,bottom: 2.0,left: 5.0 ,right: 5.0),
                // margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 40.0,
                child: InkWell(
                  onTap: () {
                    close(context, filteredApaungs[index]);
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
                        width: 135.0,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            this.filteredApaungs[index].name ?? '',
                            style: TextStyle(
                              fontSize: 15.0,
                              //fontStyle: FontStyle.italic
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
                        width: 108.0,
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            this.filteredApaungs[index].home  ?? '',
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
                        width: 50.0,
                        child: Center(
                          child: Text(
                            this.filteredApaungs[index].number ?? '',
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
                        width: 100.0,
                        padding: EdgeInsets.only(right: 5.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            this.filteredApaungs[index].amount ?? '',
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
          ),
        );
      }
    }
  }
}
