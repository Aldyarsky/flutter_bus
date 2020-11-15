import 'package:flutter/material.dart';
import 'package:busapp/core/models/cardModel.dart';
import 'package:provider/provider.dart';
import '../../core/viewmodels/CRUDModel.dart';
class BuySeat extends StatefulWidget {
  @override
  _BuySeatState createState() => _BuySeatState();
}

class _BuySeatState extends State<BuySeat> {
  final _formKey = GlobalKey<FormState>();
  String number ;


  @override
  Widget build(BuildContext context) {
    var ticketProvider = Provider.of<CRUDModel>(context) ;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Buy Seat'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Seat number',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please select Seat';
                    }
                  },
                  onSaved: (value) => number = value
              ),
              SizedBox(height: 16,),

              SizedBox(height: 16,),

              SizedBox(height: 16,),

              SizedBox(height: 16,),



              SizedBox(height: 20.0,),

            ],
          ),
        ),
      ),
    );
  }
}
