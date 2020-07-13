import 'package:easy_localization/easy_localization.dart';

extension KhmerDate on DateTime {
  String customFormat([String format = "dd MMM yyyy"]) {
    var formatter = DateFormat(format, "km-KH");
    return formatter.format(this.toLocal());
  }
}
