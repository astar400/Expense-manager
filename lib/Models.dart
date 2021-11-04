class Transaction{
  late String uid;
  late double transaction;
  String title="" ;
  late DateTime date;
  Transaction({required this.uid,required this.date,this.title="",required this.transaction});



}