part of 'configs.dart';

class AppMethods {
  static String date(String stringDate) {
    //2022-02-05
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat('d MMM yyyy').format(dateTime);
  }

  static String currency(String number) {
    return NumberFormat.currency(
      decimalDigits: 0,
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(double.parse(number));
  }

  static void dangerFlushbar(BuildContext context, String title) {
    Flushbar(
      backgroundColor: AppColor.redColor,
      title: 'Failed',
      titleColor: AppColor.backgroundColor,
      message: title,
      duration: Duration(seconds: 3),
      isDismissible: false,
    ).show(context);
  }

  static String getGreeting(int currentTime) {
    String greeting = '';

    if (currentTime >= 5 && currentTime < 12) {
      greeting = 'Pagi';
    } else if (currentTime >= 12 && currentTime < 17) {
      greeting = 'Siang';
    } else if (currentTime >= 17 && currentTime < 20) {
      greeting = 'Sore';
    } else {
      greeting = 'Malam';
    }

    return greeting;
  }
}
