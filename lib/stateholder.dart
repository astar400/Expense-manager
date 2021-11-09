import 'package:expenses_manager/Tile.dart';
import 'package:expenses_manager/add.dart';
import 'package:flutter/material.dart';

import 'Models.dart';

class Holder extends StatefulWidget {
  const Holder({Key? key}) : super(key: key);

  @override
  _HolderState createState() => _HolderState();
}

class _HolderState extends State<Holder> {
  List<Transaction> transactions = [
    Transaction(
        uid: "1", date: DateTime.now(), transaction: 12.9, title: "jbgjhghgh"),
    Transaction(
        uid: "2", date: DateTime.now(), transaction: 167.0, title: "hmm"),
    Transaction(
        uid: "1", date: DateTime.now(), transaction: 12.9, title: "jbgjhghgh"),
    Transaction(
        uid: "2", date: DateTime.now(), transaction: 167.0, title: "hmm"),
    Transaction(
        uid: "1", date: DateTime.now(), transaction: 12.9, title: "jbgjhghgh"),
    Transaction(
        uid: "2", date: DateTime.now(), transaction: 167.0, title: "hmm"),
  ];

  void _addNewTransaction(String title, double amount) {
    final newtx = Transaction(
        uid: DateTime.now().toString(),
        date: DateTime.now(),
        transaction: amount,
        title: title);
    setState(() {
      transactions.add(newtx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionInput(
          addtransaction: _addNewTransaction,
        ),
        // TransactionList(transactions: transactions)
      ],
    );
  }
}
