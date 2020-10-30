import 'package:cloud_firestore/cloud_firestore.dart';

class Ayaungg {
  String id;
  String name;
  String number;
  String date;
  String item;
  String kyat;
  String pal;
  String yway;
  String amount;
  String des;
  String imgurls;

  Ayaungg({
    this.id,
    this.name,
    this.number,
    this.date,
    this.item,
    this.kyat,
    this.pal,
    this.yway,
    this.amount,
    this.des,
    this.imgurls
   } );
   

  factory Ayaungg.fromJson(DocumentSnapshot json) => Ayaungg(
        id: json.documentID,
        name: json.data['name'],
        number: json.data['number'],
        date: json.data['date'],
        item: json.data['item'],
        kyat: json.data['kyat'],
        pal: json.data['pal'],
        yway: json.data['yway'],
        amount: json.data['amount'],
        des: json.data['des'],
        imgurls: json.data['imgurls'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'number': number,
        'date': date,
        'item': item,
        'kyat': kyat,
        'pal': pal,
        'yway': yway,
        'amount':amount,
        'des': des,
        'imgurls': imgurls,
      };
}
