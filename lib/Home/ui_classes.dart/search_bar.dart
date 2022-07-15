import 'package:flutter/material.dart';

Widget searchBar({
  required TextEditingController searchController,required Function() pressed
}) =>
    Container(
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
      // The Width Was Infinity Like Parent
      child: TextField(
        controller: searchController,
        
        decoration: InputDecoration(
          
          label: Text(
            'Search'.toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
          suffixIcon: IconButton(
            onPressed:pressed,
            
            icon:Icon(Icons.search),
            color: Colors.white,
          ),
          focusColor: Colors.white,
          // Focused Border Details
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          // Not Focused Border Details
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        style: TextStyle(color: Colors.white), // Text Style will be written in feild
      ),
    );
