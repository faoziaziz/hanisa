/* 
@author : Aziz Amerul Faozi
@desc : ini digunakan untuk sesuatu yang tidak penting
*/

import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main(){
  runApp(
    MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List <Transaction> transactions= [
    Transaction(id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now(),
    ),
    Transaction(id: 't2', title: 'old Shoes', amount: 212.9, date: DateTime.now(),),
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column (

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            child: Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            
          ),
          Card(
            color: Colors.red,
            child: Text('List of Tx'),
          ),
          Column(children: transactions.map((tx){
                return Card(
                  child: Row(children: <Widget> [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10), 
                        child:
                        Text(
                          '\$${tx.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[
                          Text(tx.title,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                          ),
                          Text(DateFormat('yyyy-MM-dd').format(tx.date),
                            style: TextStyle(color: Colors.grey,),
                          ), 
                      ],),
                ],),);
            }).toList(),),],
      ),
    );
  }
}
