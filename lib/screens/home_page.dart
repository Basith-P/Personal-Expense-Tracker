import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Expenses'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Text('Chart'),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                color: Color(0xff262626),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.teal,
                          width: 2,
                        ),
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '₹ ${tx.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          DateFormat.yMMMd().format(tx.date),
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    ));
  }
}
