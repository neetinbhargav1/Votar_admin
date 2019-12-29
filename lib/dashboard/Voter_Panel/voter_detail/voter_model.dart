import 'package:cloud_firestore/cloud_firestore.dart';

class Voter {
  final String name;
  final String roll;
  final String mobile;
  final String email;

  final DocumentReference reference;

  Voter.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        name = map['name'],

        assert(map['email'] != null),
        email = map['email'],

        assert(map['mobile'] != null),
        mobile = map['mobile'],

        assert(map['roll'] != null),
        roll = map['roll'];



  Voter.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => name;





}