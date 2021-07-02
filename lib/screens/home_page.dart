import 'package:flutter/material.dart';

import '../widgets/transaction_list.dart';
import '../widgets/new_transaction.dart';
import '../models/transaction.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Shoes',
      amount: 2300,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Headphones',
      amount: 1340,
      date: DateTime.now(),
    ),
  ];

  void _addNewTx(String txTitle, int txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTx);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('Expenses'),
          actions: [
            IconButton(
              icon: Icon(Icons.add_rounded),
              onPressed: () => _startAddNewTransaction(context),
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
              TransactionList(_userTransactions),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNewTransaction(context),
          // backgroundColor: Colors.black,
          child: Icon(
            Icons.add_rounded,
            // color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
