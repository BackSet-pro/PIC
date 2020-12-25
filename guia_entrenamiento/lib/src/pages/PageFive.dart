import 'package:flutter/material.dart';
import 'package:guia_entrenamiento/src/widgets/floatingactionbutton_widget.dart';

class PageFive extends StatefulWidget {
  PageFive() : super();
  @override
  PageFiveState createState() => PageFiveState();
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

class PageFiveState extends State<PageFive> {
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
              Text(
                "Escoja el tipo de Entrenamiento",
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButton(
        route: 'six',
        alert: false,
      ),
    );
  }

  _nextPage(BuildContext context) {
    // final route = MaterialPageRoute(builder: (BuildContext context) {
    //   return PageSix();
    // });
    // Navigator.of(context).push(route);
    Navigator.pushNamed(context, 'six');
  }
}
