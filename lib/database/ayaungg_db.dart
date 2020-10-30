import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:htay_ayaung/model/ayaungg.dart';



final Firestore _firestore = Firestore.instance;
CollectionReference _ayaunggCollection = _firestore.collection("Ayaunggb");

class DatabaseHelper {
  Stream<List<Ayaungg>> getAllAyaunggs() {
    return _ayaunggCollection.snapshots(includeMetadataChanges: true).map(
        (QuerySnapshot _querySnapshot) => _querySnapshot.documents
            .map((DocumentSnapshot _documentSnapshot) =>
                Ayaungg.fromJson(_documentSnapshot))
            .toList());
  }

Future<int> updateAyaungg(Ayaungg ayaungg){
  return _ayaunggCollection.document(ayaungg.id).updateData(ayaungg.toJson());
}

Future<int> insertAyaungg(Ayaungg ayaungg){
  return _ayaunggCollection.document().setData(ayaungg.toJson());
}

Future<int> deleteAyaungg(String id){
  return _ayaunggCollection.document(id).delete();
}


}
