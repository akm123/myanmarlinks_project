import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:htay_ayaung/model/ayaungg.dart';

class AyaunggsSearch extends SearchDelegate<Ayaungg> {
  int axisCount = 2;
  final List<Ayaungg> ayaunggs;
  List<Ayaungg> filteredAyaunggs = [];
  AyaunggsSearch({this.ayaunggs});

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
              'Enter a Ayaungg to search.',
              style: TextStyle(color: Colors.black),
            )
          ],
        )),
      );
    } else {
      filteredAyaunggs = [];
      getFilteredList(ayaunggs);
      if (filteredAyaunggs.length == 0) {
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
          child: StaggeredGridView.countBuilder(
            physics: BouncingScrollPhysics(),
            crossAxisCount: 4,
            itemCount:
                filteredAyaunggs.length == null ? 0 : filteredAyaunggs.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                close(context, filteredAyaunggs[index]);
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
                          filteredAyaunggs[index].imgurls ?? '',
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
                              child: Text(filteredAyaunggs[index].name ?? ''),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(filteredAyaunggs[index].number ?? ''),
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
          ),
        );
      }
    }
  }

  List<Ayaungg> getFilteredList(List<Ayaungg> ayaungg) {
    for (int i = 0; i < ayaungg.length; i++) {
      if (ayaungg[i].name.toLowerCase().contains(query) ||
          ayaungg[i].number.toLowerCase().contains(query) ||
          ayaungg[i].date.toLowerCase().contains(query) ||
          ayaungg[i].item.toLowerCase().contains(query) ||
          ayaungg[i].amount.toLowerCase().contains(query)) {
        filteredAyaunggs.add(ayaungg[i]);
      }
    }
    return filteredAyaunggs;
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
              'Enter a Ayaungg to search.',
              style: TextStyle(color: Colors.black),
            )
          ],
        )),
      );
    } else {
      filteredAyaunggs = [];
      getFilteredList(ayaunggs);
      if (filteredAyaunggs.length == 0) {
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
          child: StaggeredGridView.countBuilder(
            physics: BouncingScrollPhysics(),
            crossAxisCount: 4,
            itemCount:
                filteredAyaunggs.length == null ? 0 : filteredAyaunggs.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                close(context, filteredAyaunggs[index]);
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
                          filteredAyaunggs[index].imgurls ?? '',
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
                              child: Text(filteredAyaunggs[index].name ?? ''),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(filteredAyaunggs[index].number ?? ''),
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
          ),
        );
      }
    }
  }
}
