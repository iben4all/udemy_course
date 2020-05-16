import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';



class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required Transaction transaction,
    @required Function removeTx,
  }) : _transaction = transaction, _removeTx = removeTx, super(key: key);

  final Transaction _transaction;
  final Function _removeTx;

  @override
  Widget build(BuildContext context) {
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
                  '\$${_transaction.amount}',
                )),
          ),
        ),
        title: Text(
          _transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(_transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
          label: Text('delete'),
          textColor: Theme.of(context).errorColor,
          onPressed: () => _removeTx(_transaction.id),
          icon: Icon(
            Icons.delete,
            size: 24,
            color: Theme.of(context).errorColor,
          ),
        )
            : IconButton(
          onPressed: () => _removeTx(_transaction.id),
          icon: Icon(
            Icons.delete,
            size: 24,
            color: Theme.of(context).errorColor,
          ),
        ),
      ),
    );
  }
}
