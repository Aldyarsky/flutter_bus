import 'package:flutter/material.dart';
import 'package:busapp/core/models/cardModel.dart';
import 'package:busapp/ui/views/ticketDetails.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';



class TicketCard extends StatelessWidget {
  final Ticket ticketDetails;

  TicketCard({@required this.ticketDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => TicketDetails(ticket: ticketDetails)));
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            constraints: BoxConstraints(maxWidth: MediaQuery
                .of(context)
                .size
                .width * 1),
            height: MediaQuery
                .of(context)
                .size
                .height * 0.45,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.9,
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Hero(
                      tag: ticketDetails.id,
                      child: Image.asset(
                        'assets/${ticketDetails.img}',
                        height: MediaQuery
                          .of(context)
                          .size
                          .height *
                          0.15,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width *
                            0.4,
                      ),
                    ),
                  Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            ticketDetails.bus_type,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 22,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              ticketDetails.plate,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(
                              '${ticketDetails.price} \$',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              ticketDetails.seats.toString() + " seats",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        )

                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: <Widget>[

                          Text(
                            ticketDetails.location,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            "Out date",
                            style: TextStyle(
                                height: 2,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                     "Date:" + DateFormat('yMd').format(ticketDetails.dateOut).toString() + " " + DateFormat('EEEE').format(ticketDetails.dateOut).toString()+
                            "\n" + "Time: " + DateFormat("jm").format(ticketDetails.dateOut).toString(),
                            style: TextStyle(
                                height: 1.3,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            "Come date",
                            style: TextStyle(
                                height: 2,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            "Date:" + DateFormat('yMd').format(ticketDetails.dateCome).toString() + " " + DateFormat('EEEE').format(ticketDetails.dateCome).toString()+
                                "\n" + "Time: " + DateFormat("jm").format(ticketDetails.dateCome).toString(),
                            style: TextStyle(
                                height: 1.3,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )

          ),

        ),
      ),
    );
  }
}
