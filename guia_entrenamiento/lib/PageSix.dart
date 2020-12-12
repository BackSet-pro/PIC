import 'package:flutter/material.dart';

class DropDownSix extends StatefulWidget {
  DropDownSix() : super();
  final String title = "DropDown Demo";
  @override
  DropDownSixState createState() => DropDownSixState();
}

class Training {
  int id;
  String name;

  Training(this.id, this.name);

  static List<Training> getTrainings() {
    return <Training>[
      Training(1, 'Por tiempo'),
      Training(2, 'Calentamiento'),
      Training(3, 'Inicial'),
      Training(4, 'Principal'),
      Training(5, 'Estiramiento'),
    ];
  }
}

class Time {
  int id;
  String name;

  Time(this.id, this.name);

  static List<Time> getTimes() {
    return <Time>[
      Time(1, '5 min'),
      Time(2, '10 min'),
      Time(3, '15 min'),
      Time(4, '20 min'),
      Time(5, '25 min'),
    ];
  }
}

class Rep {
  int id;
  String name;

  Rep(this.id, this.name);

  static List<Rep> getRep() {
    return <Rep>[
      Rep(1, '5'),
      Rep(2, '10'),
      Rep(3, '15'),
      Rep(4, '20'),
      Rep(5, '25'),
    ];
  }
}

class DropDownSixState extends State<DropDownSix> {
  //
  List<Training> _trainings = Training.getTrainings();
  List<DropdownMenuItem<Training>> _dropdownMenuItems;
  Training _selectedTraining;

  List<Time> _times = Time.getTimes();
  List<DropdownMenuItem<Time>> _dropdownMenuItemsTime;
  Time _selectedTime;

  List<Rep> _reps = Rep.getRep();
  List<DropdownMenuItem<Rep>> _dropdownMenuItemsRep;
  Rep _selectedRep;

  List<bool> checkBoxValues = [false, false, false];
  List<bool> checkBoxValuesCalentameinto = [false, false, false];

  int _selectedIndex = 0;

  @override
  void initState() {
    _dropdownMenuItemsTime = buildDropdownMenuItemsTime(_times);
    _selectedTime = _dropdownMenuItemsTime[0].value;

    _dropdownMenuItems = buildDropdownMenuItems(_trainings);
    _selectedTraining = _dropdownMenuItems[0].value;

    _dropdownMenuItemsRep = buildDropdownMenuItemsRep(_reps);
    _selectedRep = _dropdownMenuItemsRep[0].value;

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
      _selectedTraining = selectedTraining;
    });
  }

  onChangeDropdownItemTime(Time selectedTime) {
    setState(() {
      _selectedTime = selectedTime;
    });
  }

  onChangeDropdownItemRep(Rep selectedRep) {
    setState(() {
      _selectedRep = selectedRep;
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
                buildContainer(selectedTraining: _selectedTraining.name),
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
              porTiempo(
                imageName: 'logo_c1.png',
                imageH: 50,
                titleImage: 'Superior',
                fontSize: 25,
              ),
              const SizedBox(
                height: 20.0,
              ),
              porTiempo(
                imageName: 'logo_c2.png',
                imageH: 50,
                titleImage: 'Medio',
                fontSize: 25,
              ),
              const SizedBox(
                height: 20.0,
              ),
              porTiempo(
                imageName: 'logo_c3.png',
                imageH: 50,
                titleImage: 'Inferior',
                fontSize: 25,
              ),
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
                  posCheckBox: 1),
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
      case 'principal':
        container = Container(
          child: Column(
            children: [
              principal(
                imageName: 'logo_r1.jpg',
                imageH: 50,
                titleImage: 'Rep.',
                fontSize: 25,
              ),
              const SizedBox(
                height: 20.0,
              ),
              principal(
                imageName: 'logo_r2.jpg',
                imageH: 50,
                titleImage: 'Rep.',
                fontSize: 25,
              ),
              const SizedBox(
                height: 20.0,
              ),
              principal(
                imageName: 'logo_r3.jpg',
                imageH: 50,
                titleImage: 'Rep.',
                fontSize: 25,
              ),
              const SizedBox(
                height: 20.0,
              ),
              principal(
                imageName: 'logo_r4.jpg',
                imageH: 50,
                titleImage: 'Rep.',
                fontSize: 25,
              ),
              const SizedBox(
                height: 20.0,
              ),
              principal(
                imageName: 'logo_r4.jpg',
                imageH: 50,
                titleImage: 'Rep.',
                fontSize: 25,
              ),
            ],
          ),
        );
        break;
      case 'estiramiento':
        container = Container(
          child: Column(
            children: [
              porTiempo(
                imageName: 'logo_c1.png',
                imageH: 50,
                titleImage: 'tiempo',
                fontSize: 25,
              ),
              const SizedBox(
                height: 20.0,
              ),
              porTiempo(
                imageName: 'logo_c2.png',
                imageH: 50,
                titleImage: 'tiempo.',
                fontSize: 25,
              ),
              const SizedBox(
                height: 20.0,
              ),
              porTiempo(
                imageName: 'logo_c3.png',
                imageH: 50,
                titleImage: 'tiempo',
                fontSize: 25,
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
      value: _selectedTraining,
      items: _dropdownMenuItems,
      onChanged: onChangeDropdownItem,
    );
  }

  DropdownButton<Time> buildDropdownButtonTime() {
    return DropdownButton(
      value: _selectedTime,
      items: _dropdownMenuItemsTime,
      onChanged: onChangeDropdownItemTime,
    );
  }

  DropdownButton<Rep> buildDropdownButtonRep() {
    return DropdownButton(
      value: _selectedRep,
      items: _dropdownMenuItemsRep,
      onChanged: onChangeDropdownItemRep,
    );
  }

  StatelessWidget porTiempo({
    String imageName,
    double imageH,
    String titleImage,
    double fontSize,
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
            child: buildDropdownButtonTime(),
          ),
        ],
      ),
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
      value: checkBoxValuesCalentameinto[posCheckBox],
      onChanged: (bool value) {
        setState(
          () => checkBoxValuesCalentameinto[posCheckBox] = value,
        );
      },
    );
  }

  StatelessWidget principal({
    String imageName,
    double imageH,
    String titleImage,
    double fontSize,
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
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
          Expanded(
            child: buildDropdownButtonRep(),
          ),
        ],
      ),
    );
  }
}
