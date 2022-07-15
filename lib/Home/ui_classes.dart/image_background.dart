import 'package:flutter/material.dart';
import 'package:weather/Home/ui_classes.dart/search_bar.dart';

/* Container Background Image */
Widget imageBackground(
        {required double heightMQ ,//MediaQueriy Height
        required double widthMQ,//MediaQueriy Width
        required TextEditingController searchController,//SearchBar Text Editing Controller
        required Function() pressed,
        }) =>
    Container(
      width: double.infinity, // infinity To Take All Screen Width 
      height: heightMQ * .35, // Container and Image Height 
      decoration: const BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken), //Color Filter To Dark Image lightness
              image: AssetImage('assets/images/cloud-in-blue-sky.jpg'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
      child: searchBar(searchController: searchController,pressed: pressed ),//Search Bar TextFeild
    );
