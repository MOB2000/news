import 'package:easy_localization/easy_localization.dart';
import 'package:timeago/timeago.dart' as timeago;

class StringsHelper {
  StringsHelper._();

  static String formatException(e) {
    return e.toString().replaceAll('Exception:', '');
  }

  static String formatDateAgo(DateTime dateTime) {
    return timeago.format(
      dateTime,
      allowFromNow: true,
      locale: 'en',
    );
  }

  static String getDate(DateTime dateTime) {
    return DateFormat('d-MMM-yyyy').format(dateTime);
  }

  static String getTime(DateTime dateTime) {
    return DateFormat('mm : H', 'en').format(dateTime);
  }
}
