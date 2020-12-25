import 'package:flutter/material.dart';

String selectedItem;

// ignore: must_be_immutable
class DropDownWidget extends StatefulWidget {
  List<String> dropDownList;
  DropDownWidget({@required this.dropDownList});

  get itemValue {
    return selectedItem;
  }

  @override
  _DropDownWidgetState createState() =>
      _DropDownWidgetState(dropDownList: dropDownList);
}

class _DropDownWidgetState extends State<DropDownWidget> {
  List<String> dropDownList;
  _DropDownWidgetState({@required this.dropDownList});

  List<DropdownMenuItem<String>> _dropdownMenuItems;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(dropDownList);
    selectedItem = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems(List itemList) {
    List<DropdownMenuItem<String>> items = List();
    print(itemList);
    for (var i = 0; i < itemList.length; i++) {
      items.add(
        DropdownMenuItem(
          value: i.toString(),
          child: Text(
            itemList[i],
            textAlign: TextAlign.right,
          ),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(String selecteItem) {
    setState(() {
      selectedItem = selecteItem;
    });
  }

  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: selectedItem,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: onChangeDropdownItem,
        items: _dropdownMenuItems);
  }
}
