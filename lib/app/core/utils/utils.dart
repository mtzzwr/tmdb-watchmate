import 'package:intl/intl.dart';

class Utils {
  static String formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final formatter = DateFormat('dd/MM/yyyy');
      return formatter.format(date);
    } catch (e) {
      return dateString;
    }
  }

  static double starAverage(double voteAverage) {
    return voteAverage / 2;
  }
}
