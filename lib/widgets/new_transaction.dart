import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
