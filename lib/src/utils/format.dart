import 'package:intl/intl.dart';

class FormatUtils{
  static String formatDate(DateTime date){
    DateFormat  dateFormat = DateFormat("yyyy-MM-dd");
    return dateFormat.format(date);
  }
}