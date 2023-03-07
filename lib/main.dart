import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';

// class imports

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

// PROPERTIES
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
      body: SingleChildScrollView(
        child: Column(
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
            UserTransactions()
          ], // children widget of Column
        ),
      ),
    );
  }
}
