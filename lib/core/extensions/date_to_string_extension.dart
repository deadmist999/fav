import 'package:intl/intl.dart';

extension DateToStringExtension on DateTime {
  String dateToString() {
    return DateFormat('dd MMMM yyyy', 'en_En').format(this);
  }
}
