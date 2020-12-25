class Training {
  int id;
  String name;

  Training(this.id, this.name);

  static List<Training> getTrainings() {
    return <Training>[
      Training(0, 'Por tiempo'),
      Training(1, 'Calentamiento'),
      Training(2, 'Inicial'),
      Training(3, 'Principal'),
      Training(4, 'Estiramiento'),
    ];
  }
}

class Time {
  int id;
  String name;

  Time(this.id, this.name);

  static List<Time> getTimes() {
    return <Time>[
      Time(0, '1 min'),
      Time(1, '2 min'),
      Time(2, '3 min'),
      Time(3, '4 min'),
      Time(4, '5 min'),
    ];
  }
}

class Rep {
  int id;
  String name;

  Rep(this.id, this.name);

  static List<Rep> getReps() {
    return <Rep>[
      Rep(0, '1'),
      Rep(1, '2'),
      Rep(2, '3'),
      Rep(3, '4'),
      Rep(4, '5'),
    ];
  }
}
