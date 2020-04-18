import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transaction;
  final Function _removeTx;

  TransactionList(this._transaction, this._removeTx);

  @override
  Widget build(BuildContext context) {
    return _transaction.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Container(
                    height: constraints.maxHeight * 0.15,
                    child: Text(
                      'No transaction added yet!',
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: _transaction.length,
            itemBuilder: (ctx, index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            '\$${_transaction[index].amount}',
                          )),
                    ),
                  ),
                  title: Text(
                    _transaction[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(_transaction[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          label: Text('delete'),
                          textColor: Theme.of(context).errorColor,
                          onPressed: () => _removeTx(_transaction[index].id),
                          icon: Icon(
                            Icons.delete,
                            size: 24,
                            color: Theme.of(context).errorColor,
                          ),
                        )
                      : IconButton(
                          onPressed: () => _removeTx(_transaction[index].id),
                          icon: Icon(
                            Icons.delete,
                            size: 24,
                            color: Theme.of(context).errorColor,
                          ),
                        ),
                ),
              );
            },
          );
  }
}
