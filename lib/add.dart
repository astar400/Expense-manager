
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class TransactionInput extends StatefulWidget {
  TransactionInput({Key? key,required this.addtransaction}) : super(key: key);
  late Function addtransaction;

  @override
  _TransactionInputState createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  String titleInput="";

  String AmountInput="";

  TextEditingController titlecontroller=TextEditingController();

  TextEditingController amountcontroller=TextEditingController();

  void submit(){
    String title =titlecontroller.text;
    try{
    double amt=double.parse(amountcontroller.text);
    if(amt<=0||title.isEmpty){
      print("empty check");
      return;
    }
    widget.addtransaction(title,amt);
    }

    catch(e){
      print(e.toString());


    }




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
              // onChanged: (val){ titleInput=val;},
              decoration: InputDecoration(
              labelText: "Title",

            ),),
            TextField(
              controller:amountcontroller,
              onChanged: (val){ AmountInput=val;},
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_){
                submit();
                Navigator.of(context).pop();

              },
              decoration: InputDecoration(

              labelText: "Amount",

            ),),
            FlatButton(onPressed: (){
              print(AmountInput);
              print(titleInput);
              print(amountcontroller.text);
              submit();
              Navigator.of(context).pop();


            }, child: Text("Add Transaction",style: TextStyle(color: Colors.purpleAccent),))

          ],
        ),
      ),
    );
  }
}
