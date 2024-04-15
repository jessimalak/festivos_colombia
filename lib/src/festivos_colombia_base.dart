import 'package:festivos_colombia/src/day.dart';

class ColombianHolidays {
  static final List<Day> _days = [
    Day(1, 1, false),
    Day(8, 1, false),
    Day(20, 3, true),
    Day(0, 0, false, -3),
    Day(0, 0, false, -2),
    Day(1, 5, false),
    Day(0, 0, true, 40),
    Day(0, 0, true, 60),
    Day(0, 0, true, 71),
    Day(29, 6, true),
    Day(20, 7, false),
    Day(7, 8, false),
    Day(15, 8, true),
    Day(12, 10, true),
    Day(1, 11, true),
    Day(11, 11, true),
    Day(8, 12, false),
    Day(25, 12, false),
  ];

  static DateTime _getEasterSunday(int year) {
    double a = year % 19;
    double b = year % 4;
    double c = year % 7;
    double d = (19 * a + 24) % 30;
    double e = (2 * b + 4 * c + 6 * d + 5) % 7;
    int day = (22 + d + e).toInt();
    if (day >= 1 && day <= 31) {
      return DateTime(year, 3, day);
    }
    return DateTime(year, 4, day - 31);
  }

  static DateTime _getHolidayDate(int year, Day day) {
    var newDay = DateTime(year, day.month, day.day);
    if (day.daysFromEaster != 0) {
      DateTime easterSunday = _getEasterSunday(year);
      if (day.daysFromEaster < 0) {
        newDay = easterSunday.subtract(Duration(days: day.daysFromEaster.abs()));
      }
      newDay = easterSunday.add(Duration(days: day.daysFromEaster));
    }
    if (!day.isNextMonday || newDay.weekday == DateTime.monday) {
      return newDay;
    }
    for (int i = 1; i < 7; i++) {
      DateTime nextDay = newDay.add(Duration(days: i));
      if (nextDay.weekday != DateTime.monday) continue;
      return nextDay;
    }
    return newDay;
  }

  static bool isHoliday(DateTime date) {
    for (Day holiday in _days) {
      var realDate = _getHolidayDate(date.year, holiday);
      if (realDate.day == date.day && realDate.month == date.month) return true;
    }
    return false;
  }

  static List<DateTime> getYearHolidays(int year) {
    if (year < 1000) throw Exception('Year must be higger than 1000');
    var result = _days.map((day) => _getHolidayDate(year, day));
    return result.toList();
  }

  static List<DateTime> getMonthHolidays(int year, int month) {
    if (year < 1000) throw Exception('Year must be higger than 1000');
    if (month < 1 && month > 12) throw Exception('Invalid month');
    var holidays = _days.map((day) => _getHolidayDate(year, day));
    holidays = holidays.where((day) => day.month == month);
    return holidays.toList();
  }
}
