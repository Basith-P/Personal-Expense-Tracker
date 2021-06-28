import 'package:flutter/material.dart';

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
            Card(
              color: Color(0xff262626),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => print(titleController.text),
                      label: Text('Add transaction'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        padding: EdgeInsets.all(18),
                      ),
                      icon: Icon(Icons.arrow_downward_rounded),
                    ),
                  ],
                ),
              ),
            ),
            TransactionList(),
          ],
        ),
      ),
    ));
  }
}
