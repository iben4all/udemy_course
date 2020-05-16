import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './transationItem.dart';

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
              return TransactionItem(transaction: _transaction[index], removeTx: _removeTx);
            },
          );
  }
}

