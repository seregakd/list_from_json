import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../model/ItemModel.dart';

class ListItem extends StatelessWidget  {
  final ItemModel itemModel;
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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Checkbox(value: itemModel.valueCheckbox, onChanged: _valueCbChanged),

        Flexible(
          fit: FlexFit.loose,
          child: Column(
              children: [
                Text(itemModel.title, textAlign: TextAlign.center),
                Text(itemModel.body, textAlign: TextAlign.left),
               ]),
        ),

/*
        Column(
          children: [
 //           Text(itemModel.title, textAlign: TextAlign.center),
            Flexible(
                child: Text(itemModel.body, textAlign: TextAlign.left),
            ),



        ]),

 */
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
