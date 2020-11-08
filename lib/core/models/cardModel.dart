import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {
  String id;
  String price;
  String location;
  DateTime dateOut;
  DateTime dateCome;
  String img;
  int seats;
  String plate;
  String bus_type;

  Ticket({this.id, this.price, this.location,this.img, this.dateOut, this.dateCome, this.seats, this.plate,this.bus_type});

  Ticket.fromMap(Map snapshot,String id) :
        id = id ?? '',
        price = snapshot['price'] ?? '',
        location = snapshot['name'] ?? '',
        img = snapshot['img'] ?? '',
        dateOut = (snapshot['dateOut'] as Timestamp).toDate(),
        dateCome = (snapshot['dateCome'] as Timestamp).toDate(),
        seats = snapshot['seats'],
        plate = snapshot['plate'],
        bus_type = snapshot['bus_type'];

  toJson() {
    return {
      "price": price,
      "name": location,
      "img": img,
      "dateOut": dateOut,
      "dateCome": dateCome,
      "seats": seats,
      "plate": plate,
      "bus_type": bus_type
    };
  }
}