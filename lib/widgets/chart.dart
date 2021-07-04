import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTxValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      int totalSum = 0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum = recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return groupedTxValues.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as int);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(totalSpending);
    return Card(
      elevation: 6,
      child: Row(
        children: groupedTxValues.map((e) {
          return ChartBar(
            e['day'].toString(),
            (e['amount'] as int),
            (e['amount'] as double) / totalSpending,
          );
        }).toList(),
      ),
    );
  }
}
