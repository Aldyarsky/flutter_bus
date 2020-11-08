import 'package:flutter/material.dart';
import 'package:busapp/core/models/cardModel.dart';
import 'package:busapp/core/viewmodels/CRUDModel.dart';
import 'package:busapp/ui/views/modifyTicket.dart';
import 'package:provider/provider.dart';

class TicketDetails extends StatelessWidget {
  final Ticket ticket;

  TicketDetails({@required this.ticket});

  @override
  Widget build(BuildContext context) {
    final ticketProvider = Provider.of<CRUDModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: <Widget>[
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.edit),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> ModifyProduct(ticket: ticket)));
            },
          ),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.delete_forever),
            onPressed: ()async {
              await ticketProvider.removeTicket(ticket.id);
              Navigator.pop(context) ;
            },
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: ticket.id,
            child: Image.asset(
              'assets/${ticket.img}',
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            ticket.location,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontStyle: FontStyle.italic),
          ),
          Text(
            '${ticket.price} \$',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                fontStyle: FontStyle.italic,
                color: Colors.orangeAccent),
          ),
         
        ],
      ),
    );
  }
}