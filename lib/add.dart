
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class TransactionInput extends StatelessWidget {
  TransactionInput({Key? key,required this.addtransaction}) : super(key: key);
  String titleInput="";
  String AmountInput="";
  late Function addtransaction;
  TextEditingController titlecontroller=TextEditingController();
  TextEditingController amountcontroller=TextEditingController();
  void submit(){

    addtransaction(titlecontroller.text,double.parse(amountcontroller.text));

  }

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: titlecontroller,
              onChanged: (val){ titleInput=val;},
              decoration: InputDecoration(
              labelText: "Title",

            ),),
            TextField(
              controller:amountcontroller,
              onChanged: (val){ AmountInput=val;},
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_){
                submit();

              },
              decoration: InputDecoration(

              labelText: "Amount",

            ),),
            FlatButton(onPressed: (){
              print(AmountInput);
              print(titleInput);
              print(amountcontroller.text);
              submit();


            }, child: Text("Add Transaction",style: TextStyle(color: Colors.purpleAccent),))

          ],
        ),
      ),
    );
  }
}
