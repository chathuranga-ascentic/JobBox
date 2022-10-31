import 'package:flutter/material.dart';
import 'package:job_box/app/app_color.dart';
import 'package:job_box/screens/home/profile_screen.dart';
import 'package:job_box/screens/widgets/base_screen_widget.dart';
import 'package:job_box/screens/widgets/square_button.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'employment_info.dart';

class UploadDocuments extends StatelessWidget {
  final String jobName;

  const UploadDocuments(this.jobName, {Key? key}) : super(key: key);

  static Route route(String jobName) {
    return MaterialPageRoute<void>(builder: (_) => UploadDocuments(jobName));
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
                  applyToJobHeader(
                      context, jobName, 1, "Uploading Documents", Icons.close),
                  const SizedBox(height: 20.0),
                  userUploads(
                      "Resume",
                      "Remember to include your most updated resume",
                      "Resume",
                      "pdf",
                      "11/06/20"),
                  const SizedBox(height: 20.0),
                  userUploads(
                      "Cover Letter",
                      "Stand out with your cover letter",
                      "cover letter final",
                      "doc",
                      "11/06/20"),
                  const SizedBox(height: 10.0),
                  userUploadsFiles("cover letter", "doc", "11/06/20",
                      headingColor: atomicTangerinColor,
                      subHeadingColor: atomicTangerinColor,
                      boxColor: veryLightPinkColor,
                      borderColor: antiqueWhiteColor),
                ],
              ),
            ),
            SquareButton(
              btnTitle: "Proceed",
              bgColor: atomicTangerinColor,
              textColor: whiteColor,
              onPress: () => Navigator.of(context)
                  .push<void>(EmploymentInfo.route(jobName)),
            ),
          ],
        ),
      ),
    );
  }
}

Widget userUploads(String heading, String subHeading, String documentName,
        String documentExtention, String date,
        {Color headingColor = whiteColor,
        Color subHeadingColor = whiteColor,
        Color boxColor = atomicTangerinColor}) =>
    Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        heading,
                        style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            color: taupeColor),
                      ),
                      Text(
                        subHeading,
                        style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: nobelColor),
                      ),
                    ]),
              ),
              const Icon(
                Icons.add,
                size: 30.0,
                color: taupeColor,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          userUploadsFiles(
            documentName,
            documentExtention,
            date,
            headingColor: headingColor,
            subHeadingColor: subHeadingColor,
          ),
        ],
      ),
    );

Widget applyToJobHeader(BuildContext context, String jobName, int stepNumber,
        String stepHeading, IconData icon) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(icon, size: 32.0, color: taupeColor),
        ),
        const SizedBox(height: 8.0),
        Text(
          "Apply To $jobName",
          style: const TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.w600, color: taupeColor),
        ),
        const SizedBox(height: 20.0),
        stepProgressIndicator(stepNumber, stepHeading),
      ],
    );

Widget userUploadsFiles(
        String documentName, String documentExtention, String date,
        {Color headingColor = whiteColor,
        Color subHeadingColor = whiteColor,
        Color boxColor = atomicTangerinColor,
        Color borderColor = atomicTangerinColor}) =>
    Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15.0),
      height: 80,
      decoration: BoxDecoration(
          color: boxColor,
          shape: BoxShape.rectangle,
          border: Border.all(color: borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: userEmploymentInfo(documentName, documentExtention, date,
          headingColor: headingColor, subHeadingColor: subHeadingColor),
    );

Widget stepProgressIndicator(int currentStep, String stepHeading) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stepHeading,
          style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: atomicTangerinColor),
        ),
        const SizedBox(height: 5.0),
        StepProgressIndicator(
          totalSteps: 3,
          currentStep: currentStep,
          size: 4,
          padding: 0,
          selectedColor: atomicTangerinColor,
          unselectedColor: tequilaColor,
          roundedEdges: const Radius.circular(10),
        ),
      ],
    );
