import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;

  TransactionList(this._transactions, this._deleteTransaction);

  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? Column(
            children: <Widget>[
              Text('No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.contain,
                ),
                height: 200,
              )
            ],
          )
        : ListView.builder(
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
                                '\$${_transactions[index].amount.toStringAsFixed(2)}')),
                      )),
                  title: Text(
                    _transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(DateFormat.yMMMd()
                      .format(_transactions[index].date)
                      .toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () {
                      _deleteTransaction(_transactions[index].id);
                    },
                  ),
                ),
              );
            },
            itemCount: _transactions.length,
          );
  }
}
