import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

showMsg(BuildContext context, String msg) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(msg)));
}

String getFormattedDate(DateTime dt) {
  return DateFormat('dd/MM/yyyy').format(dt);
}

String getFormattedTime(TimeOfDay t) =>
    DateFormat('hh:mm a').format(DateTime(0, 0, 0, t.hour, t.minute));
