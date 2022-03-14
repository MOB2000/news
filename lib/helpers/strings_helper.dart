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
}
