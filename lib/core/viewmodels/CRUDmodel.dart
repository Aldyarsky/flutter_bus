import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/cardModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModel extends ChangeNotifier {
  Api _api = locator<Api>();

  List<Ticket> tickets;


  Future<List<Ticket>> fetchTickets() async {
    var result = await _api.getDataCollection();
    tickets = result.documents
        .map((doc) => Ticket.fromMap(doc.data, doc.documentID))
        .toList();
    return tickets;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Ticket> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Ticket.fromMap(doc.data, doc.documentID) ;
  }


  Future removeTicket(String id) async{
    await _api.removeDocument(id) ;
    return ;
  }
  Future updateTicket(Ticket data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addTicket(Ticket data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}