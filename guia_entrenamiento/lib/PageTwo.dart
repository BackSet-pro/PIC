import 'package:flutter/material.dart';

class DropDownTwo extends StatefulWidget {
  DropDownTwo() : super();
  final String title = "DropDown Demo";
  @override
  DropDownState createState() => DropDownState();
}

class Unit {
  int id;
  String name;

  Unit(this.id, this.name);

  static List<Unit> getUnits() {
    return <Unit>[
      Unit(1, '17 B.S "PASTAZA"'),
      Unit(2, '7 B.I.MOT "LOJA"'),
      Unit(3, '13 B.I.MOPT "PICHINCHA"'),
      Unit(4, '9 B.F.E "PATRIA"'),
      Unit(5, '5 B.I.MOT "GUAYAS"'),
    ];
  }
}

class DropDownState extends State<DropDownTwo> {
  //
  List<Unit> _units = Unit.getUnits();
  List<DropdownMenuItem<Unit>> _dropdownMenuItems;
  Unit _selectedUnit;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_units);
    _selectedUnit = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Unit>> buildDropdownMenuItems(List unities) {
    List<DropdownMenuItem<Unit>> items = List();
    for (Unit unit in unities) {
      items.add(DropdownMenuItem(
        value: unit,
        child: Text(
          unit.name,
          textAlign: TextAlign.right,
        ),
      ));
    }
    return items;
  }

  onChangeDropdownItem(Unit selectedUnit) {
    setState(() {
      _selectedUnit = selectedUnit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Guía digital de entrenamiento físico",
                style: TextStyle(
                    height: 1,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                "Complete su perfil",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red[300],
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              DropdownButton(
                value: _selectedUnit,
                items: _dropdownMenuItems,
                onChanged: onChangeDropdownItem,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Selected: ${_selectedUnit.name}'),
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {},
                child: const Text('Siguiente', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
