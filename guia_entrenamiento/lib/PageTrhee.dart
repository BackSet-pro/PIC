import 'package:flutter/material.dart';
import 'package:guia_entrenamiento/PageFour.dart';

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
  int _selectedIndex = 0;

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
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
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.45,
                      right: MediaQuery.of(context).size.width * 0.45),
                  child: FlatButton(
                    color: Colors.transparent,
                    //splashColor: Colors.black26,
                    onPressed: () {
                      _nextPage(context);
                    },
                    child: Text(
                      '" "',
                      style: TextStyle(color: Colors.transparent, fontSize: 5),
                    ),
                  ),
                ),
                //Text('Selected: ${_selectedPerson.name}'),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.navigate_before),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.navigate_next),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Padding passwordAdmin(String personType) {
    double width = MediaQuery.of(context).size.width;
    Padding aux = Padding(
      padding: EdgeInsets.all(0.0),
    );
    switch (personType.toLowerCase()) {
      case 'administrador':
        aux = Padding(
          padding: EdgeInsets.only(left: width * 0.20, right: width * 0.20),
          child: TextFormField(
            decoration: InputDecoration(hintText: 'Contraseña'),
            obscureText: true,
          ),
        );
        break;
      default:
    }
    return aux;
  }

  _nextPage(BuildContext context) {
    final route = MaterialPageRoute(builder: (BuildContext context) {
      return PageFour();
    });
    Navigator.of(context).push(route);
  }
}
