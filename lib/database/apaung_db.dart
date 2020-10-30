import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:htay_ayaung/model/apaung.dart';



final Firestore _firestore = Firestore.instance;
CollectionReference _apaungCollection = _firestore.collection("Apaungb");

class DatabaseHelper {
  Stream<List<Apaung>> getAllApaungs() {
    return _apaungCollection.snapshots(includeMetadataChanges: true).map(
        (QuerySnapshot _querySnapshot) => _querySnapshot.documents
            .map((DocumentSnapshot _documentSnapshot) =>
                Apaung.fromJson(_documentSnapshot))
            .toList());
  }

Future<int> updateApaung(Apaung apaung){
  return _apaungCollection.document(apaung.id).updateData(apaung.toJson());
}

Future<int> insertApaung(Apaung apaung){
  return _apaungCollection.document().setData(apaung.toJson());
}

Future<int> deleteApaung(String id){
  return _apaungCollection.document(id).delete();
}


}
