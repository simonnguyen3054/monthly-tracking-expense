import 'package:flutter/material.dart';
import 'package:monthlyl_expense_tracking/models/transactions.dart';
import 'package:intl/intl.dart';
import 'package:monthlyl_expense_tracking/new_transaction.dart';

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
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
            button: TextStyle(color: Colors.white)),
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
  final List<Transaction> _userTransaction = [
    Transaction(
        id: DateTime.now().toString(),
        title: "Shirt",
        amount: 20.0,
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        title: "Shoe",
        amount: 40.0,
        date: DateTime.now())
  ];
  double _budget = 500.0;
  double _balance;

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  //open modal
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          //return NewTransaction widget and pass _addNewTransaction method to it
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Card(
              elevation: 6,
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(12),
                  width: 300,
                  child: Text(
                    'Balance: \$${this._budget}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ))),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 600,
            child: ListView.builder(
              itemCount: _userTransaction.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                                child: Text(
                                    '\$${_userTransaction[index].amount}')))),
                    title: Text(_userTransaction[index].title),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(_userTransaction[index].date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
