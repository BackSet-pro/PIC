import 'package:flutter/material.dart';

class DropDownTrhee extends StatefulWidget {
  DropDownTrhee() : super();
  final String title = "DropDown Demo";
  @override
  DropDownTrheeState createState() => DropDownTrheeState();
}

class Person {
  int id;
  String name;

  Person(this.id, this.name);

  static List<Person> getPersons() {
    return <Person>[
      Person(1, 'Administrador'),
      Person(2, 'Usuario'),
    ];
  }
}

class DropDownTrheeState extends State<DropDownTrhee> {
  //
  List<Person> _persons = Person.getPersons();
  List<DropdownMenuItem<Person>> _dropdownMenuItems;
  Person _selectedPerson;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_persons);
    _selectedPerson = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Person>> buildDropdownMenuItems(List persons) {
    List<DropdownMenuItem<Person>> items = List();
    for (Person person in persons) {
      items.add(DropdownMenuItem(
        value: person,
        child: Text(
          person.name,
          textAlign: TextAlign.right,
        ),
      ));
    }
    return items;
  }

  onChangeDropdownItem(Person selectedPerson) {
    setState(() {
      _selectedPerson = selectedPerson;
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
                value: _selectedPerson,
                items: _dropdownMenuItems,
                onChanged: onChangeDropdownItem,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Selected: ${_selectedPerson.name}'),
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
