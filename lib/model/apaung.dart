import 'package:cloud_firestore/cloud_firestore.dart';

class Apaung {
  String id;
  String name;
  String number;
  String home;
  String date;
  String item;
  String kyat;
  String pal;
  String yway;
  String amount;
  String des;
  String rate;

  Apaung({
    this.id,
    this.name,
    this.number,
    this.home,
    this.date,
    this.item,
    this.kyat,
    this.pal,
    this.yway,
    this.amount,
    this.des,
    this.rate,
   } );
   

  factory Apaung.fromJson(DocumentSnapshot json) => Apaung(
        id: json.documentID,
        name: json.data['name'],
        number: json.data['number'],
        home: json.data['home'],
        date: json.data['date'],
        item: json.data['item'],
        kyat: json.data['kyat'],
        pal: json.data['pal'],
        yway: json.data['yway'],
        amount: json.data['amount'],
        des: json.data['des'],
        rate: json.data['rate'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'number': number,
        'home': home,
        'date': date,
        'item': item,
        'kyat': kyat,
        'pal': pal,
        'yway': yway,
        'amount':amount,
        'des': des,
        'rate': rate,
      };
}
