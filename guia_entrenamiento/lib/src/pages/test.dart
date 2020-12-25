import 'package:flutter/material.dart';
import 'Models.dart';

class DropDown extends StatefulWidget {
  DropDown() : super();
  final String title = "DropDown Demo";
  @override
  DropDownState createState() => DropDownState();
}

class DropDownState extends State<DropDown> {
  List<Training> _trainings = Training.getTrainings();
  List<DropdownMenuItem<Training>> _dropDownMenuItemsTraining;

  List<Time> _times = Time.getTimes();
  List<DropdownMenuItem<Time>> _dropDownMenuItemsTime;

  List<Rep> _reps = Rep.getReps();
  List<DropdownMenuItem<Rep>> _dropDownMenuItemsRep;

  Training _currentTraining;
  Time _currentTime;
  List<Rep> _currentRep;

  @override
  void initState() {
    _dropDownMenuItemsTraining = buildDropdownMenuItemsTraining(_trainings);
    _currentTraining = _dropDownMenuItemsTraining[0].value;

    _dropDownMenuItemsTime = buildDropdownMenuItemsTime(_times);
    _currentTime = _dropDownMenuItemsTime[0].value;

    _dropDownMenuItemsRep = buildDropdownMenuItemsRep(_reps);
    _currentRep[0] = _dropDownMenuItemsRep[0].value;
    _currentRep[1] = _dropDownMenuItemsRep[0].value;
    _currentRep[2] = _dropDownMenuItemsRep[0].value;
    _currentRep[3] = _dropDownMenuItemsRep[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Training>> buildDropdownMenuItemsTraining(
      List trainingies) {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'City.',
                style: TextStyle(height: 5, fontSize: 10),
              ),
              DropdownButton(
                value: _currentTraining,
                items: _dropDownMenuItemsTraining,
                onChanged: changedDropDownItemTraining,
              ),
              DropdownButton(
                value: _currentTime,
                items: _dropDownMenuItemsTime,
                onChanged: changedDropDownItemTime,
              ),
              DropdownButton(
                value: _currentRep[0],
                items: _dropDownMenuItemsRep,
                onChanged: changedDropDownItemRep,
              ),
              DropdownButton(
                value: _currentRep[1],
                items: _dropDownMenuItemsRep,
                onChanged: changedDropDownItemRep1,
              ),
              DropdownButton(
                value: _currentRep[2],
                items: _dropDownMenuItemsRep,
                onChanged: changedDropDownItemRep2,
              ),
              DropdownButton(
                value: _currentRep[3],
                items: _dropDownMenuItemsRep,
                onChanged: changedDropDownItemRep3,
              ),
            ],
          ),
        ),
      )),
    );
  }

  void changedDropDownItemTraining(Training selectedTraining) {
    setState(() {
      _currentTraining = selectedTraining;
    });
  }

  void changedDropDownItemTime(Time selectedTime) {
    setState(() {
      _currentTime = selectedTime;
    });
  }

  void changedDropDownItemRep(Rep selectedRep) {
    setState(() {
      _currentRep[0] = selectedRep;
    });
  }

  void changedDropDownItemRep1(Rep selectedRep) {
    setState(() {
      _currentRep[1] = selectedRep;
    });
  }

  void changedDropDownItemRep2(Rep selectedRep) {
    setState(() {
      _currentRep[2] = selectedRep;
    });
  }

  void changedDropDownItemRep3(Rep selectedRep) {
    setState(() {
      _currentRep[3] = selectedRep;
    });
  }
}
