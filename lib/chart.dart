import 'package:expenses_manager/Bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Models.dart';

class Chart extends StatelessWidget {
  late List<Transaction> transactions;

  Chart({Key? key, required this.transactions}) : super(key: key);

  List<Map<String, Object>> get charts {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));

      double totalsum = 0;
      for (int i = 0; i < transactions.length; i++) {
        if ((transactions[i].date.day == weekday.day) &&
            (transactions[i].date.month == weekday.month) &&
            (transactions[i].date.year == weekday.year)) {
          totalsum += transactions[i].transaction;
        }
      }
      print(totalsum);
      print(DateFormat.E().format(weekday));

      return {"day": DateFormat.E().format(weekday), "amount": totalsum};
    });
  }

  double get total {
    return charts.fold(0.00, (sum, element) {
      return sum + (element["amount"] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(charts);
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: charts
              .map((element) {
                return Flexible(
                    fit: FlexFit.tight,
                    child: Bar(
                        day: element["day"].toString(),
                        amount: element["amount"] as double,
                        spendpercent: total == 0
                            ? 0.75
                            : (element["amount"] as double) / total));
              })
              .toList()
              .reversed
              .toList(),
        ),
      ),
    );
  }
}
