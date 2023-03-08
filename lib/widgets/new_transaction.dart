import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // addTx Function will be used to pass the new transaction
  // to the UserTransactions
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  // class constructor
  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
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
              keyboardType: TextInputType.number,
              // the (_) => anonymous functions with _ means that it is not used.
              // onSubmitted need a string type
              onSubmitted: (_) => submitData(),
              // onChanged : (val) {
              //   amountInput = val;
              // },
              // OR
              // onChanged : (val) => amountInput = val,
            ),
            TextButton(
              onPressed: () => submitData,
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
