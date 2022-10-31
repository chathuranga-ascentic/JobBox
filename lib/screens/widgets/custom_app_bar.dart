import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_box/app/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String userEmail;

  const CustomAppBar({
    Key? key,
    this.height = kToolbarHeight,
    required this.userEmail,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: atomicTangerinColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 10),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text("Hi " + userEmail,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: taupeColor)),
                  const SizedBox(width: 2.0),
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: Center(
                        child: SvgPicture.asset(
                      'assets/icons/ic_hand_wave.svg',
                      width: 16,
                      color: tequilaColor,
                    )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text("Find The Best Job Here!",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: taupeColor))),
            const SizedBox(
              height: 10.0,
            ),
            const SizedBox(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  filled: true,
                  fillColor: hitPinkColor,
                  hintText: "Start searching for jobs.",
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                      color: hitPinkColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: hitPinkColor),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: hitPinkColor)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
