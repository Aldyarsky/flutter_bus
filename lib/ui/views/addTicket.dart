import 'package:flutter/material.dart';
import 'package:busapp/core/models/cardModel.dart';
import 'package:provider/provider.dart';
import '../../core/viewmodels/CRUDModel.dart';
class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  String productType = 'Bag';
  String title ;
  String price ;
  String seats ;
  String bus_type;
  String plate;
  DateTime selectedDateout = DateTime.now();
  DateTime selectedDatecome = DateTime.now();
  Future<void> _selectDateout(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDateout,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDateout)
      setState(() {
        selectedDateout = picked;
      });
  }
  Future<void> _selectDatecome(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDatecome,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDatecome)
      setState(() {
        selectedDatecome = picked;
      });
  }
  @override
  Widget build(BuildContext context) {
    var ticketProvider = Provider.of<CRUDModel>(context) ;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Add Ticket'),
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
                    hintText: 'Location',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Location';
                    }
                  },
                  onSaved: (value) => title = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Price',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter The price';
                    }
                  },
                  onSaved: (value) => price = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Bus Type',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter The bus type';
                    }
                  },
                  onSaved: (value) => bus_type = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Plate example: KZ 000 ABC 02',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter The plate';
                    }
                  },
                  onSaved: (value) => plate = value
              ),
              SizedBox(height: 16,),
              TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Number of Seats',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter seats';
                    }
                  },
                  onSaved: (value) => seats = value
              ),


              SizedBox(height: 20.0,),
              RaisedButton(
                onPressed: () => _selectDateout(context),
                child: Text('Select out date'),
              ),
              Text("${selectedDateout.toLocal()}".split(' ')[0]),
              SizedBox(height: 20.0,),
              RaisedButton(
                onPressed: () => _selectDatecome(context),
                child: Text('Select come date'),
              ),
              Text("${selectedDatecome.toLocal()}".split(' ')[0]),



              RaisedButton(
                splashColor: Colors.red,
                onPressed: () async{
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await ticketProvider.addTicket(Ticket(location: title,price: price,img: "bus.png",
                        dateOut: selectedDateout, dateCome: selectedDatecome, seats: int.parse(seats),
                        bus_type: bus_type, plate: plate));
                    Navigator.pop(context) ;
                  }
                },
                child: Text('Add Ticket', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              )

            ],
          ),
        ),
      ),
    );
  }
}
