import 'package:flutter/material.dart';
import 'package:weather/Home/ui_classes.dart/weather_card/city_name.dart';

import '../../../componentes/widgets.dart';

Widget weatherDetails(
        {required String description, //Weather Status
        required String temp, //Weather temp
        required String tempMin, //Weather temp Minimum
        required String tempMax, //Weather Maximum
        required context}) =>
    Column(
      children: [
        weatherTXT(
            txt: description,
            context: context,
            color: txtColor,
            fontWeight: FontWeight.w500,size: 22),
        SizedBox(height: 5,),
        weaterTemp(
          context: context,
          temp: temp,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: txtColor, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5,),

        weatherTXT(
            txt: 'min: $tempMin /max: ${tempMax}',
            context: context,
            color: txtColor,
            fontWeight: FontWeight.w700,size: 10)
      ],
    );
Widget weaterTemp({required String temp, required context, TextStyle? style}) =>

    Text(
      '$temp',
      style: style != null
          ? style
          : Theme.of(context).textTheme.headline4!.copyWith(
                color: txtColor,
              ),
    );
