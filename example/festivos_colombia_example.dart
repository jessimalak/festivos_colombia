import 'package:festivos_colombia/festivos_colombia.dart';

void main() {
  var today = DateTime.now();
  bool todayIsHoliday = ColombianHolidays.isHoliday(today);
  List<DateTime> holidaysOnCurrentMonth = ColombianHolidays.getMonthHolidays(today.year, today.month);
  List<DateTime> allYearHolidays = ColombianHolidays.getYearHolidays(today.year);
  print('Hoy es fesivo $todayIsHoliday');
  print('Festivos del mes $holidaysOnCurrentMonth');
  print('Festivos del año $allYearHolidays');
}
