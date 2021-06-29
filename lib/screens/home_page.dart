import 'package:flutter/material.dart';

import '../widgets/user_transactions.dart';
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
          actions: [
            IconButton(
              icon: Icon(Icons.add_rounded),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Text('Chart'),
              ),
              UserTransactions(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add_rounded,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
