import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        backgroundColor: Colors.green[900],
      ),
      body: transactions.isEmpty
          ? Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  'Não há transações',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                final Transaction transaction = transactions[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.monetization_on),
                    title: Text(
                      transaction.value.toString(),
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      transaction.contact.accountNumber.toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
