import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/Home/ui_classes.dart/weather_card/weather_details.dart';
import 'package:weather/Home/ui_classes.dart/weather_card/weather_image.dart';

import 'city_name.dart';


Widget weatherCard(
        {required String cityname,
        required windSpeed,
        required String description,
        required String temp,
        required String tempMin,
        required String tempMax,
        required context}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      // width: Take It Like Parent (infinity),
      // height: Take It Like Parent (infinity),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              cityName(cityname: cityname),
              Text(
                //Date Time Under City Name
                // DateTime.now().add(Duration(days:1)).toString(),
                '${DateFormat.yMMMd().format(DateTime.now()).toString()}',
                style:
                    TextStyle(color: txtColor, fontWeight: FontWeight.normal),
              ),
              Divider(),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    weatherDetails(
                        description: description,
                        temp: temp,
                        tempMin: tempMin,
                        tempMax: tempMax,
                        context: context),
                    Column(
                      children: [
                        weatherImage(context: context, height: 100, width: 100),
                        Text(
                          windSpeed,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w700),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
