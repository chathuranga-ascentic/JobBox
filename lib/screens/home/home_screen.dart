import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_box/app/app_color.dart';
import 'package:job_box/blocs/app/app_bloc.dart';
import 'package:job_box/blocs/blocs.dart';
import 'package:job_box/screens/home/profile_screen.dart';
import 'package:job_box/screens/widgets/base_screen_widget.dart';
import 'package:job_box/screens/widgets/bottom_nav_bar.dart';
import 'package:job_box/screens/widgets/custom_app_bar.dart';
import 'package:job_box/screens/widgets/radio_button.dart';

import 'applied_jobs_screen.dart';
import '../elements/error.dart';
import '../elements/job_list.dart';
import '../elements/loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

  static Page page() => const MaterialPage<void>(child: HomeScreen());
}

class _HomeScreenState extends State<HomeScreen> {
  late JobsBloc jobsBloc;

  @override
  void initState() {
    jobsBloc = BlocProvider.of<JobsBloc>(context);
    jobsBloc.add(FetchJobsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return BaseScreenWidget(
      appBar: CustomAppBar(height: 190, userEmail: user.email!),
      body: Column(
        children: [
          RadioButton(
              choicesList: const ['Recent Jobs', 'Near You'],
              onChoiceSelected: (choice) {}),
          BlocBuilder<JobsBloc, JobsState>(builder: (context, state) {
            if (state is JobInitialState) {
              return buildLoading();
            } else if (state is JobLoadingState) {
              return buildLoading();
            } else if (state is JobLoadedState) {
              return buildJobsList(state.jobs, isJobList: true);
            } else if (state is JobErrorState) {
              return buildError(state.message);
            }
            return buildLoading();
          }),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
          backgroundColor: whiteColor,
          onValueSelected: (int index) {
            switch (index) {
              case 1:
                Navigator.of(context).push<void>(AppliedJobs.route());
                break;
              case 2:
                Navigator.of(context).push<void>(ProfileScreen.route());
                break;
            }
          }),
    );
  }
}
