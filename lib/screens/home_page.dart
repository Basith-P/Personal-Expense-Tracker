import 'package:flutter/material.dart';

import '../widgets/transaction_list.dart';
import '../widgets/new_transaction.dart';
import '../widgets/chart.dart';
import '../models/transaction.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTx {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTx(String txTitle, double txAmount, DateTime choosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: choosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTx(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
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
    final appBar = AppBar(
      title: Text('Expenses'),
      actions: [
        IconButton(
          icon: Icon(Icons.add_rounded),
          onPressed: () => _startAddNewTransaction(context),
        )
      ],
    );
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.teal,
        appBar: appBar,
        body: Container(
          // padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.vertical) *
                    0.3,
                child: Chart(_recentTx),
              ),
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.vertical) *
                    0.7,
                child: TransactionList(_userTransactions, _deleteTx),
              ),
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
