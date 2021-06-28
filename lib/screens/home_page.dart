import 'package:flutter/material.dart';

import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import '../models/transaction.dart';

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [];

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Expenses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Card(
              child: Text('Chart'),
            ),
            NewTransaction(),
            TransactionList(),
          ],
        ),
      ),
    ));
  }
}
