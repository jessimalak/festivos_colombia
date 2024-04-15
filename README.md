## Features

- Saber si un dia especifico es festivo;
- Obtener los festivos de un año
- Obtener los festivos de un mes específico 

## Usage

Verificar día

```dart
    var today = DateTime.now();
    bool todayIsHoliday = ColombianHolidays.isHoliday(today);
```

Festivos por mes
```dart
  List<DateTime> holidaysOnMonth = ColombianHolidays.getMonthHolidays(2024, 5);
```

Festivos del año
```dart
  List<DateTime> allYearHolidays = ColombianHolidays.getYearHolidays(2024);
```
