import 'package:expenses_manager/Models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  List<Transaction> transactions;
  TransactionList({Key? key,required this.transactions}) : super(key: key);

  @override
  _TransactionListState createState() => _TransactionListState(transactions: transactions);
}

class _TransactionListState extends State<TransactionList> {
  late List<Transaction> transactions;
  _TransactionListState({required this.transactions});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: transactions.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (ctx,index){return Tile(trxn: transactions[index]); },
        // children: transactions.map((trxn) => Tile(trxn: trxn,)).toList(),
      ),
    );
  }
}



class Tile extends StatelessWidget {
  Transaction trxn;
  Tile({required this.trxn}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // width: 300,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              padding: EdgeInsets.all(8),
              child: Text("₹ "+trxn.transaction.toString(),
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple,fontSize: 20),),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0,color: Colors.purpleAccent)
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(trxn.title,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),

                ),
                Spacer(),
                Text(DateFormat.Hm().format(trxn.date),style: TextStyle(color: Colors.black54),),
                Text(DateFormat.MMMMd().format(trxn.date)+" "+DateFormat.y().format(trxn.date) ),
                Spacer(),
              ],
            ),
            Spacer(),
          ],
        ),

      ),
    );
  }
}
