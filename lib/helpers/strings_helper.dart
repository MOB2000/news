import 'package:timeago/timeago.dart' as timeago;

class StringsHelper {
  StringsHelper._();

  static String formatDateAgo(DateTime dateTime) {
    return timeago.format(
      dateTime,
      allowFromNow: true,
      locale: 'en',
    );
  }
}
