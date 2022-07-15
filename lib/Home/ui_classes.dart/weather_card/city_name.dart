import 'package:flutter/material.dart';

Color txtColor = Colors.black38;
Widget cityName({
  required String cityname,
}) =>
    Text(
      "$cityname".toUpperCase(),
      style: TextStyle(color: txtColor, fontWeight: FontWeight.bold),
    );
// Widget dateTime({
//   required dateTime,
// }) =>
//     Text(
//       dateTime,
//       style: TextStyle(color: txtColor, fontWeight: FontWeight.normal),
//     );
