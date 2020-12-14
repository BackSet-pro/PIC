import 'package:flutter/material.dart';
import 'Models.dart';

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

  int _selectedIndex = 0;

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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

  Container buildContainer({String selectedTraining = 'calentamiento'}) {
    Container container = Container(
      child: Text('No selected'),
    );
    switch (selectedTraining.toLowerCase()) {
      case 'por tiempo':
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
                        value: _selectedTime[0],
                        items: _dropdownMenuItemsTime,
                        onChanged: (Time selectedTime) {
                          setState(() {
                            _selectedTime[0] = selectedTime;
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
                        value: _selectedTime[1],
                        items: _dropdownMenuItemsTime,
                        onChanged: (Time selectedTime) {
                          setState(() {
                            _selectedTime[1] = selectedTime;
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
              ),
            ],
          ),
        );
        break;
      case 'calentamiento':
        container = Container(
          child: Column(
            children: [
              calentamiento(
                  imageName: 'logo_c1.png',
                  imageH: 50,
                  titleImage: 'Superior',
                  fontSize: 25,
                  posCheckBox: 0),
              const SizedBox(
                height: 20.0,
              ),
              calentamiento(
                  imageName: 'logo_c2.png',
                  imageH: 50,
                  titleImage: 'Medio',
                  fontSize: 25,
                  posCheckBox: 1),
              const SizedBox(
                height: 20.0,
              ),
              calentamiento(
                  imageName: 'logo_c3.png',
                  imageH: 50,
                  titleImage: 'Inferior',
                  fontSize: 25,
                  posCheckBox: 2),
            ],
          ),
        );
        break;
      case 'inicial':
        container = Container(
          child: Column(
            children: [
              inicial(
                  imageName: 'logo_i1.jpg',
                  imageH: 50,
                  titleImage: 'Single Under',
                  fontSize: 25,
                  posCheckBox: 0),
              const SizedBox(
                height: 20.0,
              ),
              inicial(
                imageName: 'logo_i2.jpg',
                imageH: 50,
                titleImage: 'Burpees',
                fontSize: 25,
                posCheckBox: 1,
              ),
              const SizedBox(
                height: 20.0,
              ),
              inicial(
                  imageName: 'logo_i3.jpg',
                  imageH: 50,
                  titleImage: 'Inferior',
                  fontSize: 25,
                  posCheckBox: 2),
            ],
          ),
        );
        break;

      case 'principal':
        container = Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        'assets/images/logo_r1.jpg',
                        height: 50,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Rep.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      child: DropdownButton(
                        value: _selectedRep[0],
                        items: _dropdownMenuItemsRep,
                        onChanged: (Rep selectedRep) {
                          setState(() {
                            _selectedRep[0] = selectedRep;
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
                        'assets/images/logo_r2.jpg',
                        height: 50,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Rep.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      child: DropdownButton(
                        value: _selectedRep[1],
                        items: _dropdownMenuItemsRep,
                        onChanged: (Rep selectedRep) {
                          setState(() {
                            _selectedRep[1] = selectedRep;
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
                        'assets/images/logo_r3.jpg',
                        height: 50,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Rep.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      child: DropdownButton(
                        value: _selectedRep[2],
                        items: _dropdownMenuItemsRep,
                        onChanged: (Rep selectedRep) {
                          setState(() {
                            _selectedRep[2] = selectedRep;
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
                        'assets/images/logo_r4.jpg',
                        height: 50,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Rep.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      child: DropdownButton(
                        value: _selectedRep[3],
                        items: _dropdownMenuItemsRep,
                        onChanged: (Rep selectedRep) {
                          setState(() {
                            _selectedRep[3] = selectedRep;
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
                        'assets/images/logo_r4.jpg',
                        height: 50,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Rep.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      child: DropdownButton(
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

  StatelessWidget inicial({
    String imageName,
    double imageH,
    String titleImage,
    double fontSize,
    StatefulWidget checkBox,
    int posCheckBox = 0,
  }) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Image.asset(
              'assets/images/' + imageName,
              height: imageH,
            ),
          ),
          Expanded(
            child: Text(
              titleImage,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
          Expanded(
            child: buildCheckboxInicial(posCheckBox: posCheckBox),
          ),
        ],
      ),
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

  StatelessWidget calentamiento({
    String imageName,
    double imageH,
    String titleImage,
    double fontSize,
    StatefulWidget checkBox,
    int posCheckBox = 0,
  }) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Image.asset(
              'assets/images/' + imageName,
              height: imageH,
            ),
          ),
          Expanded(
            child: Text(
              titleImage,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
          Expanded(
            child: buildCheckboxCalentamiento(posCheckBox: posCheckBox),
          ),
        ],
      ),
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
}
