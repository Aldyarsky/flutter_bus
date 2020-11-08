import 'package:busapp/ui/widgets/ticketCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:busapp/core/models/cardModel.dart';
import 'package:busapp/core/viewmodels/CRUDModel.dart';
import 'package:busapp/ui/widgets/ticketCard.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Ticket> tickets;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModel>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addProduct');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Center(child: Text('Home')),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                tickets = snapshot.data.documents
                    .map((doc) => Ticket.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: tickets.length,
                  itemBuilder: (buildContext, index) =>
                      TicketCard(ticketDetails: tickets[index]),
                );
              } else {
                return Text('fetching');
              }
            }),
      ),
    );
    ;
  }
}