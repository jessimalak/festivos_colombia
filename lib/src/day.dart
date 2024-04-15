class Day {
  final int day;
  final int month;
  final bool isNextMonday;
  final int daysFromEaster;

  Day(this.day, this.month, this.isNextMonday, [this.daysFromEaster = 0]);
}