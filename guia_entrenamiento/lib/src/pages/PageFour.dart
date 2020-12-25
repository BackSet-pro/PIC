import 'package:flutter/material.dart';

import 'package:guia_entrenamiento/src/widgets/floatingactionbutton_widget.dart';

class PageFour extends StatefulWidget {
  PageFour() : super();
  final String title = "DropDown Demo";
  @override
  PageFourState createState() => PageFourState();
}

class Training {
  int id;
  String name;

  Training(this.id, this.name);

  static List<Training> getTrainings() {
    return <Training>[
      Training(1, 'Macrociclo'),
      Training(2, 'Mesociclo'),
      Training(3, 'Microciclo'),
    ];
  }
}

class PageFourState extends State<PageFour> {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Text(
          "Guía digital de entrenamiento físico",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: Image.asset(
          'assets/images/logo.png',
          height: 25,
        ),
      ),
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
              SizedBox(
                height: 50.0,
              ),
              Text(
                "Escoja el tiempo del ciclo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              DropdownButton(
                value: _selectedTraining,
                items: _dropdownMenuItems,
                onChanged: onChangeDropdownItem,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButton(
        route: _routeSelected(_selectedTraining.name),
        alert: false,
      ),
    );
  }

  String _routeSelected(String trainingType) {
    if (trainingType.toLowerCase() == 'macrociclo') {
      return trainingType.toLowerCase();
    } else if (trainingType.toLowerCase() == 'mesociclo') {
      return trainingType.toLowerCase();
    } else if (trainingType.toLowerCase() == 'microciclo') {
      return 'five';
    }
  }
}
