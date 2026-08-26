import 'package:flutter/material.dart';

const textFieldDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.white,
            width: 2
        )
    ),
    fillColor: Colors.white,
    filled: true,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.red,
            width: 2
        )
    )
);