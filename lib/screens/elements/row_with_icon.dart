import 'package:flutter/material.dart';
import 'package:job_box/app/app_color.dart';

Widget rowWithIcon(String text, IconData icon,
        {bool isSpaceBetween = false, double fontSize = 30.0}) =>
    Row(
      mainAxisAlignment: isSpaceBetween
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: taupeColor),
        ),
        const SizedBox(width: 3.0),
        Icon(icon, size: fontSize, color: taupeColor)
      ],
    );
