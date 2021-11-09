import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TransactionInput extends StatefulWidget {
  TransactionInput({Key? key, required this.addtransaction}) : super(key: key);
  late Function addtransaction;

  @override
  _TransactionInputState createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  String titleInput = "";

  String AmountInput = "";

  TextEditingController titlecontroller = TextEditingController();

  TextEditingController amountcontroller = TextEditingController();


  DateTime date = DateTime(1964);

  void showdate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) return;
      setState(() {
        date = value;
      });
    });
  }

  void submit() {
    String title = titlecontroller.text;
    try {
      double amt = double.parse(amountcontroller.text);
      if (amt <= 0 || title.isEmpty || date == DateTime(1964)) {
        print("empty check");
        return;
      }
      widget.addtransaction(title, amt, date);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Card(
          child: Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: MediaQuery.of(context).padding.bottom + 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: titlecontroller,
                  // onChanged: (val){ titleInput=val;},
                  decoration: InputDecoration(
                    labelText: "Title",
                  ),
                ),
                TextField(
                  controller: amountcontroller,
                  onChanged: (val) {
                    AmountInput = val;
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) {
                    // submit();
                    // Navigator.of(context).pop();
                  },
                  decoration: InputDecoration(
                    labelText: "Amount",
                  ),
                ),
                Container(
                  child: Row(children: [
                    Text(date == DateTime(1964)
                        ? "no Date Chosen"
                        : DateFormat.MMMMd().format(date) +
                            " " +
                            DateFormat.y().format(date)),
                    TextButton(
                      onPressed: showdate,
                      child: Text("choose date"),
                    )
                  ]),
                ),
                FlatButton(
                    onPressed: () {
                      print(AmountInput);
                      print(titleInput);
                      print(amountcontroller.text);
                      submit();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Add Transaction",
                      style: TextStyle(color: Colors.purpleAccent),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
