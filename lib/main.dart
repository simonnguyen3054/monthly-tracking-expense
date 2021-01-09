import 'package:flutter/material.dart';
import 'package:monthlyl_expense_tracking/models/transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Monthly Tracking Expense'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [];
  double _budget = 500.0;
  double _balance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Card(
                elevation: 5,
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(12),
                    width: 300,
                    child: Text(
                      'Balance: \$${this._budget}',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ))),
            Row(
              children: [
                Container(
                  child: Text('Transaction List'),
                )
              ],
            ),
          ],
        ));
  }
}
