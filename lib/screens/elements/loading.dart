import 'package:flutter/material.dart';
import 'package:job_box/app/app_color.dart';

Widget buildLoading() => const Center(
      child: CircularProgressIndicator(
        color: atomicTangerinColor,
      ),
    );
