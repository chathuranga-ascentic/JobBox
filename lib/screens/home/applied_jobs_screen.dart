import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_box/blocs/blocs.dart';
import 'package:job_box/screens/home/home_screen.dart';
import 'package:job_box/screens/home/profile_screen.dart';
import 'package:job_box/screens/widgets/base_screen_widget.dart';
import 'package:job_box/screens/widgets/bottom_nav_bar.dart';
import '../elements/error.dart';
import '../elements/row_with_icon.dart';
import '../elements/job_list.dart';
import '../elements/loading.dart';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const AppliedJobs());
  }

  @override
  State<AppliedJobs> createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {
  late JobsBloc jobsBloc;

  @override
  void initState() {
    jobsBloc = BlocProvider.of<JobsBloc>(context);
    jobsBloc.add(FetchAppliedJobsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreenWidget(
      body: Column(
        children: [
          rowWithIcon("Your Applied Jobs", Icons.edit),
          BlocBuilder<JobsBloc, JobsState>(builder: (context, state) {
            if (state is JobInitialState) {
              return buildLoading();
            } else if (state is JobLoadingState) {
              return buildLoading();
            } else if (state is JobLoadedState) {
              return buildJobsList(state.jobs);
            } else if (state is JobErrorState) {
              return buildError(state.message);
            }
            return buildLoading();
          }),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentSelectedIndex: 1,
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
            case 2:
              Navigator.of(context).push<void>(ProfileScreen.route());
              break;
          }
        },
      ),
    );
  }
}
