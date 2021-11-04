
import 'package:expenses_manager/stateholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Manager',

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expense Manager"),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                child: Card(
                  child:Text("Chart"),
                ),
              ),
               Holder(),
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


