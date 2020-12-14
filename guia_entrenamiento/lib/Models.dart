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
      Time(0, '5 min'),
      Time(1, '10 min'),
      Time(2, '15 min'),
      Time(3, '20 min'),
      Time(4, '25 min'),
    ];
  }
}

class Rep {
  int id;
  String name;

  Rep(this.id, this.name);

  static List<Rep> getReps() {
    return <Rep>[
      Rep(0, '5'),
      Rep(1, '10'),
      Rep(2, '15'),
      Rep(3, '20'),
      Rep(4, '25'),
    ];
  }
}
