import 'package:flutter/material.dart';

import 'package:guia_entrenamiento/src/widgets/floatingactionbutton_widget.dart';

class PageTrhee extends StatefulWidget {
  PageTrhee() : super();
  final String title = "DropDown Demo";
  @override
  PageTrheeState createState() => PageTrheeState();
}

class Person {
  int id;
  String name;

  Person(this.id, this.name);

  static List<Person> getPersons() {
    return <Person>[
      Person(0, 'Usuario'),
      Person(1, 'Administrador'),
    ];
  }
}

class PageTrheeState extends State<PageTrhee> {
  //
  List<Person> _persons = Person.getPersons();
  List<DropdownMenuItem<Person>> _dropdownMenuItems;
  Person _selectedPerson;
  String _password = '';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
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
              Center(
                child: DropdownButton(
                  value: _selectedPerson,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
              ),
              passwordAdmin(_selectedPerson.name),

              //Text('Selected: ${_selectedPerson.name}'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButton(
        route: (_selectedPerson.name.toLowerCase() == 'usuario')
            ? 'final'
            : 'four',
        alert: (_selectedPerson.name.toLowerCase() == 'usuario' ||
                _password == 'admin1234')
            ? false
            : true,
        title: 'Contraseña incorrecta',
        text:
            'Verifique que su contraseña sea la adecuada y vuelva a intertarlo',
      ),
    );
  }

  Widget passwordAdmin(String personType) {
    Widget aux = Container();
    switch (personType.toLowerCase()) {
      case 'administrador':
        aux = TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Password',
            labelText: 'Password',
            helperText: 'Ingrese su contraseña',
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(Icons.lock),
          ),
          onChanged: (value) => setState(
            () {
              _password = value;
            },
          ),
        );
        break;
      default:
    }
    return aux;
  }
}
