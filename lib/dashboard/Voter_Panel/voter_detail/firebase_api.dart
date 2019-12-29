import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseAPI {
  static Stream<QuerySnapshot> voterStream =
  Firestore.instance.collection('Voter Detail').snapshots();

  static CollectionReference reference =
  Firestore.instance.collection('Voter Detail');

  static addVoter(String name, String email,String mobile, String roll) {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await reference.add({
        "name": name,
        "email": email,
        "mobile": mobile,
        "roll": roll

      });
    });
  }

  static removeVoter(String id) {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await reference.document(id).delete().catchError((error) {
        print(error);
      });
    });
  }

  static updateVoter(String id, String newName, String newEmail,  String newMobile, String newRoll) {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await reference.document(id).updateData({
        "name": newName,
        "email": newEmail,
        "mobile": newMobile,
        "roll": newRoll,


      }).catchError((error) {
        print(error);
      });
    });
  }
}