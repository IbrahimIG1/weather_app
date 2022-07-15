import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget weatherImage(
        {
        required context,
        required double width,
        required double height}) =>
    Container(
        width: width,
        height: height,
        child: LottieBuilder.asset(
          // LottieBuilder To Show Moving picture From Json File in assets/anims
          'assets/anims/cloudy.json',
        ));

Widget txtImage({required String windSpeed, required context}) =>
    Text(windSpeed,
        style: Theme.of(context)
            .textTheme
            .caption!
            .copyWith(fontSize: 15, fontWeight: FontWeight.w700),maxLines: 1,
      overflow: TextOverflow.ellipsis,);
