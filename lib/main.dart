

import 'package:expenses_manager/chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Models.dart';
import 'Tile.dart';
import 'add.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Manager',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor:Colors.amber ,
        fontFamily: "QuickSand",
        textTheme: ThemeData.light().textTheme.copyWith(headline6: TextStyle(fontFamily: "QuickSand",fontWeight: FontWeight.bold,fontSize: 18)),
        appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme.copyWith(headline6:TextStyle(fontFamily:"OpenSans",fontSize: 20)  ),
                titleTextStyle: TextStyle(fontFamily:"OpenSans"),
                    )

      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.yellow,
        backgroundColor: Colors.black,
        accentColor: Colors.purple,
        fontFamily: "OpenSans",
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(fontFamily:"OpenSans"),
        )


      ),

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transactions=[
    // Transaction(uid:"1",date: DateTime.now(),transaction:12.9,title: "jbgjhghgh"),
    // Transaction(uid:"2",date: DateTime.now(),transaction:167.0,title: "hmm"),
    // Transaction(uid:"1",date: DateTime.now(),transaction:12.9,title: "jbgjhghgh"),
    // Transaction(uid:"2",date: DateTime.now(),transaction:167.0,title: "hmm"),
    // Transaction(uid:"1",date: DateTime.now(),transaction:12.9,title: "jbgjhghgh"),
    // Transaction(uid:"2",date: DateTime.now(),transaction:167.0,title: "hmm"),
  ];
  List<Transaction> get recent{
    return transactions.where((element){
      return (element.date.isAfter(DateTime.now().subtract(Duration(days: 7))));
    }).toList();
  }

  void _addNewTransaction(String title,double amount){
    final newtx=Transaction(uid: DateTime.now().toString(), date: DateTime.now(), transaction:amount,title: title);
    setState(() {
      transactions.add(newtx);
    });
  }

  void startTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder:(ctx){ return TransactionInput(addtransaction: _addNewTransaction); });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expense Manager"),

      actions: [
        IconButton(onPressed: (){
          startTransaction(context);
        }, icon: Icon(Icons.add))
      ],),

      floatingActionButton:FloatingActionButton(onPressed: (){startTransaction(context);}, child:  Icon(Icons.add)) ,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(

                width: double.infinity,
                child: Chart(transactions: recent,)
              ),
              TransactionList(transactions: transactions),
               // Container(
               //   height: 200,
               //   child: ListView.builder(
               //    itemCount: 2 ,
               //    itemBuilder: (buildcontext,index){
               //      return Tile(trxn: transactions[index],);},),
               // )

            ],
          ),
        ),
      ),
    );
  }
}


