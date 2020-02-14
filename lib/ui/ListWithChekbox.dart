import 'package:flutter/material.dart';
import 'ListItem.dart';
import '../model/ItemModel.dart';
import '../Services.dart';

class ListWithChekbox extends StatefulWidget {
  final List itemsList;

  ListWithChekbox(this.itemsList);

  @override
  _ListWithChekboxState createState() => _ListWithChekboxState(itemsList);
}

class _ListWithChekboxState extends State<ListWithChekbox> {
  int _allCount = 0;
  bool _valueTitleCb = false;
  List models = <ItemModel>[];
  ItemModel itemModel;
  List _itemsList;

  _ListWithChekboxState(this._itemsList);

  @override
  void initState(){
    super.initState();
    _addItems();
  }

  void _addItems() {
    for (dynamic item in _itemsList) {
      models.add(ItemModel(valueCheckbox: _valueTitleCb,
               title: item["title"], body: item["body"], counter: 0));
    }
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
      itemCount: models == null ? 0 : models.length,
      cacheExtent: 100,
      itemBuilder: (context, i){
        return Card(
          child: ListItem(itemModel: models[i], listItemNumber: i,
          parentCount: refreshCount, parentCb: refreshCheckbox)
        );
      }
    );
  }
}



