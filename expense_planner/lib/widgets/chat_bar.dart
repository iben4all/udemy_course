import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar({
    @required this.label,
    @required this.spendingAmount,
    @required this.spendingPctOfTotal,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints){
      return Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight*0.15,
              child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}',
                  style: Theme.of(context).accentTextTheme.title,),
              )),
          SizedBox(
            height: constraints.maxHeight*0.05,
          ),
          Container(
            height: constraints.maxHeight*0.6,
            width: constraints.maxHeight*0.1,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight*0.05,
          ),
          Container(
            height: constraints.maxHeight*0.15,
            child: FittedBox(
              child: Text(
                label,
                style: Theme.of(context).accentTextTheme.title,

              ),
            ),
          ),
        ],
      );
    },);

  }
}
