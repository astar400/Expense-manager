import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String day;
  final double amount;
  final double spendpercent;
  const Bar({Key? key,required this.day,required this.amount,required this.spendpercent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(4),
      // width: MediaQuery.of(context).size.width/8.4,


      child: Column(

        children: [
          Container(
            height: 16,
            child: FittedBox(
                child: Text("₹ ${amount.toStringAsFixed(0)}")),
          ),
          SizedBox(height: 10,),
          Container(
            height: 50,
            width: 10,
            child: Stack(
              children: [
              Container(
              height: 50,
              width: 10,

              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color:Theme.of(context).primaryColor, ),
              ),
                FractionallySizedBox(heightFactor: spendpercent,child:Container(

                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color:Theme.of(context).accentColor, ),
                ),
                ),


              ],
            ),
          ),
          Text(day.substring(0,2))



        ],
      ),
    );
  }
}
