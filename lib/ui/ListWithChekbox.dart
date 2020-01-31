import 'package:flutter/material.dart';
import 'ListItem.dart';
import '../model/ItemModel.dart';
import '../Services.dart';

class ListWithChekbox extends StatefulWidget {
  @override
  _ListWithChekboxState createState() => _ListWithChekboxState();
}

class _ListWithChekboxState extends State<ListWithChekbox> {
  int _nameCounter = 0;
  int _allCount = 0;
  bool _valueTitleCb = false;
  List models = <ItemModel>[];
  ItemModel itemModel;

  void _addItem() {
    setState(() {
      models.add(ItemModel(valueCheckbox: _valueTitleCb,
        itemText: "Item " + (_nameCounter++).toString(), counter: 0));
    });
  }

  void _valueTitleCheckboxChanged(bool value) {
    setState(() {
      _valueTitleCb = value;
    });

    _allCount = 0;
    for (int i = 0; i < models.length; i++){
      itemModel = models[i];

      if (itemModel.valueCheckbox != value) {
        itemModel.valueCheckbox = value;

        setState(() {
          models[i] = itemModel;
        });
      }

      if (itemModel.valueCheckbox) {
        _allCount += itemModel.counter;
      }
    }
  }

  void refreshCount(int i, bool childIncrement) {
    itemModel = models[i];

    if (childIncrement) {
      itemModel.counter++;

      if (itemModel.valueCheckbox) {
        setState(() {
          _allCount++;
        });
      }
    } else {
      if (itemModel.counter > 0) {
        itemModel.counter--;

        if (itemModel.valueCheckbox) {
          setState(() {
            _allCount--;
          });
        }
      } else {
          viewShowDialog(context, "Counter must be positive");
      }
    }

    setState(() {
      models[i] = itemModel;
    });
  }

  void refreshCheckbox(int i, bool childCb) {
    itemModel = models[i];
    itemModel.valueCheckbox = childCb;

    setState(() {
      models[i] = itemModel;
    });

    if (childCb) {
      setState(() {
        _allCount += itemModel.counter;
      });
    } else {
      setState(() {
        _allCount -= itemModel.counter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildTitle()
      ),

      body: _buildList(),

      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Add item in list',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Checkbox(value: _valueTitleCb, onChanged: _valueTitleCheckboxChanged),
          Text('Select all'),
        ]),
        Text(_allCount.toString()),
      ]
    );
  }

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: models.length,
        itemBuilder: (context, i){
        return ListItem(itemModel: models[i], listItemNumber: i,
          parentCount: refreshCount, parentCb: refreshCheckbox);
        }
    );
  }
}



