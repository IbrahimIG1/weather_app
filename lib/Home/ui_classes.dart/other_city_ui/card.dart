import 'package:flutter/material.dart';
import 'package:weather/Home/ui_classes.dart/weather_card/city_name.dart';

import '../../../componentes/widgets.dart';
import '../weather_card/weather_details.dart';
import '../weather_card/weather_image.dart';


Widget otherCityCard(
        {required String cityname,
        required String temp,
        required context,
        required String txt}) =>
    Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      child: Column(
        children: [
          cityName(cityname: cityname),
          weaterTemp(
            temp:
                // DateTime.parse(AppCubit.get(context).fiveDaysModel!.data[index]['dt_txt'].toString())
                // == DateFormat.yMMMd().format(DateTime.now().add(Duration(days:1))).toString() ?
                "${double.parse(temp).ceil()} °C" //: '${AppCubit.get(context).fiveDaysModel!.data[index]['dt_txt']}',
            ,
            context: context,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: txtColor,
                ),
          ),
          weatherImage(context: context, width: 100, height: 60),
          weatherTXT(
              txt: txt,
              context: context,
              color: txtColor,
              fontWeight: FontWeight.w500,
              size: 15)
        ],
      ),
    );
