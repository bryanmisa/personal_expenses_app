import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // constructor class TransactionList has to pass a parameter called transactions
  // from declaration of List<Transaction>
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            // Child of Card - Row
            child: Row(
              children: <Widget>[
                // Child of Card Row
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    // String Interpolation
                    '\$${transactions[index].amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                // Child of Card Row - Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green),
                    ),
                    Text(
                      // Date format is a flutter package from pub.dev
                      // https://pub.dev/documentation/intl/latest/
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
        /*
        transaction.map().toList() is used to dynamically list all the transaction
        according to its number of transaction and chain with with method toList()
        to list down the transactions.
      */
        // children: transactions.map((tx) { // tx can be named any name
        //
        // }).toList(),
      ),
    ); // Column Transaction;
  }
}
