import 'package:cloud_firestore/cloud_firestore.dart';

class Seat {
  String id;
  String number;

  Seat({this.id, this.number});

  Seat.fromMap(Map snapshot,String id) :
        id = id ?? '',
        number = snapshot['number'] ?? '';


  toJson() {
    return {
      "number": number
    };
  }
}