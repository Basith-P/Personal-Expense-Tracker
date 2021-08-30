import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_tracker/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Center(
            child: Column(
              children: [
                Text(
                  'No transactions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  elevation: 8,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: FittedBox(
                            child: Text('₹${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(transactions[index].title),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_rounded),
                      onPressed: () {
                        deleteTx(transactions[index].id);
                      },
                    ),
                  ),
                ),
              );
            },
          );
  }
}
