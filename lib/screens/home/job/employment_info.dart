import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_box/app/app_color.dart';
import 'package:job_box/screens/home/job/upload_documents.dart';
import 'package:job_box/screens/widgets/base_screen_widget.dart';
import 'package:job_box/screens/widgets/input_field.dart';

class EmploymentInfo extends StatelessWidget {
  final String jobName;

  const EmploymentInfo(this.jobName, {Key? key}) : super(key: key);

  static Route route(String jobName) {
    return MaterialPageRoute<void>(builder: (_) => EmploymentInfo(jobName));
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreenWidget(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  applyToJobHeader(context, jobName, 2,
                      "Employment Information", Icons.arrow_back_ios),
                  const SizedBox(height: 20.0),
                  headinInfo("Education", "Included in Resume", false),
                  const SizedBox(height: 20.0),
                  InputField(
                    onChanged: (nameOfSchool) {},
                    labelName: 'Name of school',
                    hintText: 'Horizon Education University',
                  ),
                  const SizedBox(height: 10.0),
                  InputField(
                    onChanged: (course) {},
                    labelName: 'Course of study',
                    hintText: 'Data Analytics',
                  ),
                  const SizedBox(height: 10.0),
                  InputField(
                    onChanged: (course) {},
                    labelName: 'Year graduated',
                    hintText: '2012',
                  ),
                  const SizedBox(height: 10.0),
                  headinInfo("Work Experience", "Included in Resume", true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget headinInfo(String heading, String subHeading, bool isToggleOn) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(
              fontSize: 25.0, fontWeight: FontWeight.w600, color: taupeColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subHeading,
              style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: taupeColor),
            ),
            Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                border: Border.all(color: taupeColor),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: CupertinoSwitch(
                thumbColor: taupeColor,
                trackColor: soapStoneColor,
                value: isToggleOn,
                activeColor: soapStoneColor,
                onChanged: (value) {},
              ),
            )
          ],
        ),
      ],
    );
