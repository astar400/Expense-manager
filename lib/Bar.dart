import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String day;
  final double amount;
  final double spendpercent;
  const Bar({Key? key,required this.day,required this.amount,required this.spendpercent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {

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
              SizedBox(height: constraints.maxHeight*0.05,),
              Container(
                height: constraints.maxHeight*0.6,
                width: 10,
                // color: Colors.white,
                child: Stack(
                  children: [
                    Container(
                      // height: 50,
                      // width: 10,

                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color:Theme.of(context).primaryColor, ),
                    ),
                    FractionallySizedBox(heightFactor: spendpercent,child:Container(

                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color:Theme.of(context).accentColor, ),
                    ),
                    ),


                  ],
                ),
              ),
              SizedBox(height: constraints.maxHeight*0.05,),
              Text(day.substring(0,2))



            ],
          ),
        );
      },

    );
  }
}
