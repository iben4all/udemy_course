import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction({this.addTx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInput = TextEditingController();
  final _amountInput = TextEditingController();
  DateTime _selectedDate = null;

  bool _submitData() {
    final txTitle = _titleInput.text;
    final txAmount = double.parse(_amountInput.text);

    if (txTitle.length == 0 || txAmount < 0 || _selectedDate==null) {
      return false;
    }
    widget.addTx(
      txTitle: txTitle,
      txAmount: txAmount,
      txDate: _selectedDate,


    );
    Navigator.of(context).pop();
    return true;
  }

  _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now())
        .then((_pickedDate) {
      if (_pickedDate == null) {
        return;
      }
      _selectedDate = _pickedDate;
      if (!_submitData()){
      setState(() {
//        _selectedDate = _pickedDate;
      });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleInput,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountInput,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Text(_selectedDate == null
                          ? 'No date chosen'
                          : 'Date picked: ${DateFormat.yMd().format(_selectedDate)}'),

                    ),
                    FlatButton.icon(
                      onPressed: _presentDatePicker,
                      icon: Icon(
                        Icons.calendar_today,
                        color: Theme.of(context).primaryColor,
                      ),
                      label: Text(
                        'Pick date',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    )
                  ],
                ),
              ),
              RaisedButton(
                onPressed: _submitData,
                child: Text(
                  'Add Transaction',
                ),
                textColor: Theme.of(context).textTheme.button.color,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
