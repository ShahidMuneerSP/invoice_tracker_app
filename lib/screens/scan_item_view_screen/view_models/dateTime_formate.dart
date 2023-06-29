import 'package:intl/intl.dart';

convertDateTime(String t) {
  DateTime dateTime = DateTime.utc(
          DateTime.parse(t).year,
          DateTime.parse(t).month,
          DateTime.parse(t).day,
          DateTime.parse(t).hour,
          DateTime.parse(t).minute,
          DateTime.parse(t).second)
      .toLocal();

  String dateTimeString = DateFormat("dd-MM-yyyy").format(dateTime);

  // log(dateTimeString);
  return dateTimeString;
}
