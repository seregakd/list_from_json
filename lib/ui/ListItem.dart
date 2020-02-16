import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../model/CartItemModel.dart';

class ListItem extends StatelessWidget  {
  final CartItemModel itemModel;
  final int listItemNumber;
  final Function parentCount;
  final Function parentCb;

  ListItem({Key key, this.itemModel, this.listItemNumber,
    @required this.parentCount, @required this.parentCb}) :  super(key: key);

  void _valueCbChanged(bool value) {
    parentCb(listItemNumber, value);
  }

  void _incrementCounter(bool value) {
    parentCount(listItemNumber, value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(value: itemModel.valueCheckbox, onChanged: _valueCbChanged),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(itemModel.title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(itemModel.body),
            ]),
        ),
        _buildCount(),
      ],
    );
  }

  Widget _buildCount() {
    return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Ink(
            decoration: const ShapeDecoration(
              color: Colors.lightBlueAccent,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.remove),
              color: Colors.white,
              iconSize: 20.0,
              padding: EdgeInsets.all(10.0),
              onPressed: () => _incrementCounter(false),
            ),
          ),
          Text(itemModel.counter.toString()),
          Ink(
            decoration: const ShapeDecoration(
              color: Colors.lightBlueAccent,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              iconSize: 20.0,
              padding: EdgeInsets.all(10.0),
              onPressed: () => _incrementCounter(true),
            ),
          ),
    ]);
  }
}
