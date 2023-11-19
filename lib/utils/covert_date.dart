import 'package:synapsis_challange/constant/months.dart';

//method to convert date
//or for the easier ways u can use intl package

String converDate(String dateTime) {

  DateTime parseTime = DateTime.parse(dateTime);
  
  int day = parseTime.day;
  int month = parseTime.month;
  int year = parseTime.year;

  String monthAbbrev = monthsAbbreviation[month]!;

  String date = "$day $monthAbbrev $year";
  return date;
}
