import 'package:expenses_manager/Models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  List<Transaction> transactions;
  Function delete;
  TransactionList({Key? key,required this.transactions,required this.delete}) : super(key: key);

  @override
  _TransactionListState createState() => _TransactionListState(transactions: transactions,delete: delete);
}

class _TransactionListState extends State<TransactionList> {
  late List<Transaction> transactions;
  Function delete;
  _TransactionListState({required this.transactions,required this.delete});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height*0.55,
      // width: MediaQuery.of(context).size.width,
      child:transactions.isEmpty?
      LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return  Column(
            children: [
              Container(
                  height: constraints.maxHeight*0.5,

                  child: Image.asset("images/waiting.png",fit: BoxFit.cover,)),
              SizedBox(height: constraints.maxHeight*0.05,),
              Text("No data Available \nPlease enter Data",style: Theme.of(context).textTheme.headline6,),

            ],
          );
        },

      ) :ListView.builder(
        itemCount: transactions.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (ctx,index){return Tile(trxn: transactions[index],delete:delete ,); },
        // children: transactions.map((trxn) => Tile(trxn: trxn,)).toList(),
      ),
    );
  }
}



class Tile extends StatelessWidget {
  Transaction trxn;
  Function delete;
  Tile({required this.trxn, required this.delete}) ;

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
                  // style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  style: Theme.of(context).textTheme.headline6,

                ),
                Spacer(),
                Text(DateFormat.Hm().format(trxn.date),style: TextStyle(color: Colors.black54),),
                Text(DateFormat.MMMMd().format(trxn.date)+" "+DateFormat.y().format(trxn.date) ),
                Spacer(),
              ],
            ),
            Spacer(),
            IconButton(onPressed: (){
              delete(trxn.uid);
            }, icon: Icon(Icons.delete))
          ],
        ),

      ),
    );
  }
}
