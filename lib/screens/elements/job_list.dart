import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_box/app/app_color.dart';

import 'package:job_box/models/models.dart';
import 'package:job_box/screens/home/job/upload_documents.dart';
import 'package:job_box/screens/widgets/square_button.dart';

Widget buildJobsList(List<Jobs> job, {bool isJobList = false}) => Column(
      children: [
        !isJobList
            ? Column(
                children: [
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      const Text(
                        "You applied for",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: nobelColor),
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        job.length.toString(),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: nobelColor),
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      const Text(
                        "jobs",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: nobelColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              )
            : Container(),
        ListView.builder(
            itemCount: job.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => isJobList
                    ? showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                        context: context,
                        builder: (context) => buildSheet(job[index], context),
                      )
                    : null,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(job[index].jobChannel!.toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: atomicTangerinColor)),
                                Text(job[index].jobDate!,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: nobelColor))
                              ]),
                          const SizedBox(height: 10),
                          Text(job[index].jobHeading!,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: taupeColor)),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              SizedBox(
                                width: 15,
                                height: 15,
                                child: Center(
                                    child: SvgPicture.asset(
                                  'assets/icons/ic_money_bag.svg',
                                  width: 15,
                                  color: nobelColor,
                                )),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(job[index].jobSalary!,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: nobelColor)),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(job[index].jobLocation!,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: nobelColor)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ],
    );

Widget buildSheet(Jobs job, BuildContext context) => Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  children: [
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/icons/ic_slack.svg',
                        width: 75,
                      )),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(job.jobChannel!.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: atomicTangerinColor)),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(job.jobHeading!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: taupeColor)),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(job.jobLocation!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: nobelColor)),
                    const SizedBox(
                      height: 18.0,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Job Description",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: taupeColor)),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(job.jobDescription!,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            maxLines: 4,
                            style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: taupeColor))),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Requirments",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: taupeColor)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SquareButton(
            btnTitle: "Apply This Job",
            bgColor: atomicTangerinColor,
            textColor: whiteColor,
            onPress: () => Navigator.of(context)
                .push<void>(UploadDocuments.route(job.jobChannel!)),
          ),
        )
      ],
    );
