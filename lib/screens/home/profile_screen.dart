import 'package:flutter/material.dart';
import 'package:job_box/app/app_color.dart';
import 'package:job_box/blocs/blocs.dart';
import 'package:job_box/screens/widgets/base_screen_widget.dart';
import 'package:job_box/screens/widgets/bottom_nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_box/blocs/app/app_bloc.dart';

import 'applied_jobs_screen.dart';
import '../elements/row_with_icon.dart';
import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ProfileScreen());
  }

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return BaseScreenWidget(
      body: Column(
        children: [
          rowWithIcon("Your Profile", Icons.person),
          const SizedBox(
            height: 40.0,
          ),
          userProfileImage(),
          const SizedBox(
            height: 20.0,
          ),
          rowWithIcon("Contact Info", Icons.edit,
              isSpaceBetween: true, fontSize: 24.0),
          const SizedBox(
            height: 20.0,
          ),
          userProfileInfo("FullName", "Adrian Severian"),
          const SizedBox(
            height: 20.0,
          ),
          userProfileInfo("Email", user.email!),
          const SizedBox(
            height: 20.0,
          ),
          userProfileInfo("Mobile Number", "+ 6594717281"),
          const SizedBox(
            height: 10.0,
          ),
          const Divider(color: nobelColor),
          const SizedBox(
            height: 10.0,
          ),
          rowWithIcon("Employment Information", Icons.edit,
              isSpaceBetween: true, fontSize: 24.0),
          const SizedBox(
            height: 20.0,
          ),
          userProfileInfo("Resume", "11/06/20", isEmploymentInfo: true),
          const SizedBox(
            height: 20.0,
          ),
          userProfileInfo("Cover Letter", "11/06/20", isEmploymentInfo: true),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentSelectedIndex: 2,
        onValueSelected: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const HomeScreen();
                }),
              );
              break;
            case 1:
              Navigator.of(context).push<void>(AppliedJobs.route());
              break;
          }
        },
      ),
    );
  }
}

Widget userProfileInfo(String heading, String subHeading,
        {bool isEmploymentInfo = false}) =>
    Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(
                fontSize: 18.0, fontWeight: FontWeight.w500, color: nobelColor),
          ),
          const SizedBox(
            height: 5.0,
          ),
          !isEmploymentInfo
              ? Text(
                  subHeading,
                  style: const TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.w600,
                      color: taupeColor),
                )
              : userEmploymentInfo(heading, "pdf", subHeading),
        ],
      ),
    );

Widget userEmploymentInfo(
        String documentName, String documentExtention, String date,
        {Color headingColor = taupeColor,
        Color subHeadingColor = nobelColor}) =>
    Row(
      children: [
        Icon(Icons.insert_drive_file, size: 34.0, color: headingColor),
        const SizedBox(
          width: 5.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "My $documentName.$documentExtention",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: headingColor),
            ),
            Text(
              date,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: subHeadingColor),
            ),
          ],
        )
      ],
    );

Widget userProfileImage() => Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: whiteColor,
          width: 1.0,
        ),
      ),
      alignment: Alignment.topCenter,
      child: const CircleAvatar(
        radius: 50.0,
        backgroundColor: taupeColor,
        child: CircleAvatar(
          child: Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              backgroundColor: taupeColor,
              radius: 12.0,
              child: Icon(
                Icons.add,
                size: 18.0,
                color: whiteColor,
              ),
            ),
          ),
          radius: 50.0,
          backgroundImage: AssetImage('assets/images/dummy_user.png'),
        ),
      ),
    );
