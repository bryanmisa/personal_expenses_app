import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// class imports
import '../models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
/*
1. Card() always assumes the size of the child widget          
2. Text widgets only take the only space needs, like the length,
of the texts.
3. Containers are universal styling position positioning Widget.
4. width : double.infinity , parameter will occupy the whole row space of the
screen
*/

// Properties of the MyHomePage hardcoded
  final List<Transaction> transaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
    // Transaction(
    //   id: 't3',
    //   title: 'Car Gas',
    //   amount: 10.24,
    //   date: DateTime.now(),
    // ),
  ];
  // For Example purposes
  // late String titleInput;
  // late String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Expense Tracker'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ), //Card of the Chart Container
          ), // Container Chart
          Card(
            elevation: 5,
            child:
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget> [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title: '),
                    // val can be named anything you want
                    // onChanged: (val) {titleInput = val;},
                    // Instead use controller
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount: '),
                    controller: amountController,
                    // onChanged : (val) {
                    //   amountInput = val;
                    // },
                    // OR
                    // onChanged : (val) => amountInput = val,
                  ),
                  TextButton(
                      onPressed: () {
                        print(titleController.text);
                        print(amountController.text);
                      },
                      child: Text('Add Transaction'),
                  ),
                ],
              ),
            ),
          ),

          Column(
            /* 
              transaction.map().toList() is used to dynamically list all the transaction
              according to its number of transaction and chain with with method toList()
              to list down the transactions.
            */
            children: transaction.map((tx) {
              return Card(
                // Child of Card - Row
                child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        // String Interpolation
                        '\$${tx.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    // Child of Card - Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.green),
                        ),
                        Text(
                          // Date format is a flutter package from pub.dev
                          // https://pub.dev/documentation/intl/latest/
                          DateFormat.yMMMd().format(tx.date),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ), // Column Transaction
        ],
      ),
    );
  }
}
