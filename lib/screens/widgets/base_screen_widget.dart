import 'package:flutter/material.dart';

import 'package:job_box/app/app_color.dart';

class BaseScreenWidget extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  final EdgeInsetsGeometry? customPadding;

  const BaseScreenWidget(
      {Key? key,
      this.appBar,
      required this.body,
      this.backgroundColor = soapStoneColor,
      this.bottomNavigationBar,
      this.customPadding})
      : super(key: key);

  @override
  _BaseScreenWidgetState createState() => _BaseScreenWidgetState();
}

class _BaseScreenWidgetState extends State<BaseScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: widget.appBar,
      body: SafeArea(
          child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: widget.body,
              ))),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
