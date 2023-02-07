import 'package:intl/intl.dart';

DateTime toDateTime(int d) {
  final dt = DateTime.fromMillisecondsSinceEpoch(d * 1000);
  final dateTime = DateTime(dt.year, dt.month, dt.day);

  return dateTime;
}

String formattedDateTime(String dateInput) {
  final time = formattedTime(dateInput);
  final date = formattedDate(dateInput);

  return '$time $date';
}

String formattedDate(String dateInput) {
  final parsedDate = DateTime.parse(dateInput);

  final suffix = getDayOfMonthSuffix(parsedDate.day);
  final formattedDay = DateFormat('d').format(parsedDate);
  final formattedMonthYear = DateFormat('MMMM yyyy').format(parsedDate);

  return '$formattedDay$suffix $formattedMonthYear';
}

String formattedTime(String dateInput) {
  final parsedDate = DateTime.parse(dateInput);
  return DateFormat('jm').format(parsedDate);
}

String getDayOfMonthSuffix(int dayNum) {
  if (!(dayNum >= 1 && dayNum <= 31)) {
    throw Exception('Invalid day of month');
  }

  if (dayNum >= 11 && dayNum <= 13) {
    return 'th';
  }

  switch (dayNum % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
