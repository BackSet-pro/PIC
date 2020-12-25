import 'package:flutter/material.dart';
import 'Models.dart';
import 'package:guia_entrenamiento/src/widgets/floatingactionbutton_widget.dart';

class PageSix extends StatefulWidget {
  PageSix() : super();
  final String title = "DropDown Demo";
  @override
  PageSixState createState() => PageSixState();
}

class PageSixState extends State<PageSix> {
  //
  List<Training> _trainings = Training.getTrainings();
  List<DropdownMenuItem<Training>> _dropdownMenuItems;
  List<Training> _selectedTraining = new List(7);

  List<Time> _times = Time.getTimes();
  List<DropdownMenuItem<Time>> _dropdownMenuItemsTime;
  List<Time> _selectedTime = new List(7);

  List<Rep> _reps = Rep.getReps();
  List<DropdownMenuItem<Rep>> _dropdownMenuItemsRep;
  List<Rep> _selectedRep = new List(5);

  List<bool> checkBoxValues = [false, false, false];
  List<bool> checkBoxValuesCalentamiento = [false, false, false];

  @override
  void initState() {
    _dropdownMenuItemsTime = buildDropdownMenuItemsTime(_times);
    _selectedTime[0] = _dropdownMenuItemsTime[0].value;
    _selectedTime[1] = _dropdownMenuItemsTime[0].value;
    _selectedTime[2] = _dropdownMenuItemsTime[0].value;
    _selectedTime[3] = _dropdownMenuItemsTime[0].value;
    _selectedTime[4] = _dropdownMenuItemsTime[0].value;
    _selectedTime[5] = _dropdownMenuItemsTime[0].value;
    _selectedTime[6] = _dropdownMenuItemsTime[0].value;

    _dropdownMenuItems = buildDropdownMenuItems(_trainings);
    _selectedTraining[0] = _dropdownMenuItems[0].value;
    _selectedTraining[1] = _dropdownMenuItems[0].value;
    _selectedTraining[2] = _dropdownMenuItems[0].value;
    _selectedTraining[3] = _dropdownMenuItems[0].value;
    _selectedTraining[4] = _dropdownMenuItems[0].value;
    _selectedTraining[5] = _dropdownMenuItems[0].value;
    _selectedTraining[6] = _dropdownMenuItems[0].value;

    _dropdownMenuItemsRep = buildDropdownMenuItemsRep(_reps);
    _selectedRep[0] = _dropdownMenuItemsRep[0].value;
    _selectedRep[1] = _dropdownMenuItemsRep[0].value;
    _selectedRep[2] = _dropdownMenuItemsRep[0].value;
    _selectedRep[3] = _dropdownMenuItemsRep[0].value;
    _selectedRep[4] = _dropdownMenuItemsRep[0].value;

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

  List<DropdownMenuItem<Time>> buildDropdownMenuItemsTime(List times) {
    List<DropdownMenuItem<Time>> items = List();
    for (Time time in times) {
      items.add(
        DropdownMenuItem(
          value: time,
          child: Text(time.name),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<Rep>> buildDropdownMenuItemsRep(List reps) {
    List<DropdownMenuItem<Rep>> items = List();
    for (Rep time in reps) {
      items.add(
        DropdownMenuItem(
          value: time,
          child: Text(time.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Training selectedTraining) {
    setState(() {
      _selectedTraining[0] = selectedTraining;
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
              buildDropdownButtonTraining(),
              const SizedBox(
                height: 20.0,
              ),
              /*Text('Selected: ${_selectedTraining.name}'),
                const SizedBox(
                  height: 20.0,
                ),*/
              buildContainer(selectedTraining: _selectedTraining[0].name),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButton(
        route: '/',
        alert: false,
      ),
    );
  }

  Container buildContainer({String selectedTraining = 'calentamiento'}) {
    Container container = Container(
      child: Text('No selected'),
    );

    switch (selectedTraining.toLowerCase()) {
      case 'por tiempo':
        container = Container(
          child: Column(
            children: [
              ListTile(
                title: _textTile('Tiempo'),
                leading: Image.asset(
                  'assets/images/logo_c1.png',
                  height: 50,
                ),
                trailing: DropdownButton(
                  value: _selectedTime[0],
                  items: _dropdownMenuItemsTime,
                  onChanged: (Time selectedTime) {
                    setState(() {
                      _selectedTime[0] = selectedTime;
                    });
                  },
                ),
              ),
              ListTile(
                title: _textTile('Tiempo'),
                leading: Image.asset(
                  'assets/images/logo_c2.png',
                  height: 50,
                ),
                trailing: DropdownButton(
                  value: _selectedTime[1],
                  items: _dropdownMenuItemsTime,
                  onChanged: (Time selectedTime) {
                    setState(() {
                      _selectedTime[1] = selectedTime;
                    });
                  },
                ),
              ),
              ListTile(
                title: _textTile('Tiempo'),
                leading: Image.asset(
                  'assets/images/logo_c3.png',
                  height: 50,
                ),
                trailing: DropdownButton(
                  value: _selectedTime[2],
                  items: _dropdownMenuItemsTime,
                  onChanged: (Time selectedTime) {
                    setState(() {
                      _selectedTime[2] = selectedTime;
                    });
                  },
                ),
              ),
            ],
          ),
        );
        break;
      case 'calentamiento':
        container = Container(
          child: Column(
            children: [
              ListTile(
                title: _textTile('Superior'),
                leading: Image.asset(
                  'assets/images/logo_c1.png',
                  height: 50,
                ),
                trailing: buildCheckboxCalentamiento(posCheckBox: 0),
              ),
              ListTile(
                title: _textTile('Medio'),
                leading: Image.asset(
                  'assets/images/logo_c2.png',
                  height: 50,
                ),
                trailing: buildCheckboxCalentamiento(posCheckBox: 1),
              ),
              ListTile(
                title: _textTile('Inferior'),
                leading: Image.asset(
                  'assets/images/logo_c3.png',
                  height: 50,
                ),
                trailing: buildCheckboxCalentamiento(posCheckBox: 2),
              ),
            ],
          ),
        );
        break;
      case 'inicial':
        container = Container(
          child: Column(
            children: [
              ListTile(
                title: _textTile('Single Under'),
                leading: Image.asset(
                  'assets/images/logo_i1.jpg',
                  height: 50,
                ),
                trailing: buildCheckboxInicial(posCheckBox: 0),
              ),
              ListTile(
                title: _textTile('Burpees'),
                leading: Image.asset(
                  'assets/images/logo_i2.jpg',
                  height: 50,
                ),
                trailing: buildCheckboxInicial(posCheckBox: 1),
              ),
              ListTile(
                title: _textTile('Inferior'),
                leading: Image.asset(
                  'assets/images/logo_i3.jpg',
                  height: 50,
                ),
                trailing: buildCheckboxInicial(posCheckBox: 2),
              ),
            ],
          ),
        );
        break;

      case 'principal':
        container = Container(
          child: Column(
            children: [
              ListTile(
                title: _textTile('Rep.'),
                leading: Image.asset(
                  'assets/images/logo_r1.jpg',
                  height: 50,
                ),
                trailing: DropdownButton(
                  value: _selectedRep[0],
                  items: _dropdownMenuItemsRep,
                  onChanged: (Rep selectedRep) {
                    setState(() {
                      _selectedRep[0] = selectedRep;
                    });
                  },
                ),
              ),
              ListTile(
                title: _textTile('Rep.'),
                leading: Image.asset(
                  'assets/images/logo_r2.jpg',
                  height: 50,
                ),
                trailing: DropdownButton(
                  value: _selectedRep[1],
                  items: _dropdownMenuItemsRep,
                  onChanged: (Rep selectedRep) {
                    setState(() {
                      _selectedRep[1] = selectedRep;
                    });
                  },
                ),
              ),
              ListTile(
                title: _textTile('Rep.'),
                leading: Image.asset(
                  'assets/images/logo_r3.jpg',
                  height: 50,
                ),
                trailing: DropdownButton(
                  value: _selectedRep[2],
                  items: _dropdownMenuItemsRep,
                  onChanged: (Rep selectedRep) {
                    setState(() {
                      _selectedRep[2] = selectedRep;
                    });
                  },
                ),
              ),
              ListTile(
                title: _textTile('Rep.'),
                leading: Image.asset(
                  'assets/images/logo_r4.jpg',
                  height: 50,
                ),
                trailing: DropdownButton(
                  value: _selectedRep[3],
                  items: _dropdownMenuItemsRep,
                  onChanged: (Rep selectedRep) {
                    setState(() {
                      _selectedRep[3] = selectedRep;
                    });
                  },
                ),
              ),
              ListTile(
                title: _textTile('Rep.'),
                leading: Image.asset(
                  'assets/images/logo_r4.jpg',
                  height: 50,
                ),
                trailing: DropdownButton(
                  value: _selectedRep[4],
                  items: _dropdownMenuItemsRep,
                  onChanged: (Rep selectedRep) {
                    setState(() {
                      _selectedRep[4] = selectedRep;
                    });
                  },
                ),
              ),
            ],
          ),
        );
        break;
      case 'estiramiento':
        container = Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        'assets/images/logo_c1.png',
                        height: 50,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'tiempo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      child: DropdownButton(
                        value: _selectedTime[3],
                        items: _dropdownMenuItemsTime,
                        onChanged: (Time selectedTime) {
                          setState(() {
                            _selectedTime[3] = selectedTime;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        'assets/images/logo_c2.png',
                        height: 50,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'tiempo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      child: DropdownButton(
                        value: _selectedTime[4],
                        items: _dropdownMenuItemsTime,
                        onChanged: (Time selectedTime) {
                          setState(() {
                            _selectedTime[4] = selectedTime;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        'assets/images/logo_c3.png',
                        height: 50,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'tiempo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      child: DropdownButton(
                        value: _selectedTime[5],
                        items: _dropdownMenuItemsTime,
                        onChanged: (Time selectedTime) {
                          setState(() {
                            _selectedTime[5] = selectedTime;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        'assets/images/logo_c1.png',
                        height: 50,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'tiempo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      child: DropdownButton(
                        value: _selectedTime[6],
                        items: _dropdownMenuItemsTime,
                        onChanged: (Time selectedTime) {
                          setState(
                            () {
                              _selectedTime[6] = selectedTime;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70.0,
              ),
              RaisedButton(
                onPressed: () {},
                child: const Text('Finalizar', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        );
        break;
      default:
    }
    return container;
  }

  DropdownButton<Training> buildDropdownButtonTraining() {
    return DropdownButton(
      value: _selectedTraining[0],
      items: _dropdownMenuItems,
      onChanged: onChangeDropdownItem,
    );
  }

  Checkbox buildCheckboxInicial({int posCheckBox}) {
    return Checkbox(
      value: checkBoxValues[posCheckBox],
      onChanged: (bool value) {
        setState(
          () => checkBoxValues[posCheckBox] = value,
        );
      },
    );
  }

  Checkbox buildCheckboxCalentamiento({int posCheckBox}) {
    return Checkbox(
      value: checkBoxValuesCalentamiento[posCheckBox],
      onChanged: (bool value) {
        setState(
          () => checkBoxValuesCalentamiento[posCheckBox] = value,
        );
      },
    );
  }

  Widget _textTile(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 30),
      textAlign: TextAlign.center,
    );
  }
}
