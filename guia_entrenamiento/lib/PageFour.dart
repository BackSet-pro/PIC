import 'package:flutter/material.dart';

class DropDownFour extends StatefulWidget {
  DropDownFour() : super();
  final String title = "DropDown Demo";
  @override
  DropDownFourState createState() => DropDownFourState();
}

class Training {
  int id;
  String name;

  Training(this.id, this.name);

  static List<Training> getTrainings() {
    return <Training>[
      Training(1, 'Fuerza'),
      Training(2, 'Inicial'),
      Training(3, 'AMRAP'),
      Training(4, 'EMOM'),
      Training(5, 'Tabata'),
      Training(6, 'Sin tiempo'),
    ];
  }
}

class DropDownFourState extends State<DropDownFour> {
  //
  List<Training> _trainings = Training.getTrainings();
  List<DropdownMenuItem<Training>> _dropdownMenuItems;
  Training _selectedTraining;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_trainings);
    _selectedTraining = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Training>> buildDropdownMenuItems(List trainingies) {
    List<DropdownMenuItem<Training>> items = List();
    for (Training training in trainingies) {
      items.add(
        DropdownMenuItem(
          value: training,
          child: Text(training.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Training selectedTraining) {
    setState(() {
      _selectedTraining = selectedTraining;
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
              Text("Select a training"),
              SizedBox(
                height: 20.0,
              ),
              DropdownButton(
                value: _selectedTraining,
                items: _dropdownMenuItems,
                onChanged: onChangeDropdownItem,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Selected: ${_selectedTraining.name}'),
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
