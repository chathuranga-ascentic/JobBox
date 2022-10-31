import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_box/models/models.dart';
import 'package:job_box/repositories/repositories.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobsRepository jobsRepository;

  JobsBloc(this.jobsRepository) : super(JobInitialState()) {
    on<FetchJobsEvent>(_fetchAllRecentJobs);
    on<FetchAppliedJobsEvent>(_fetchAllAppliedJobs);
  }

  _fetchAllRecentJobs(
    FetchJobsEvent event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobLoadingState());
    try {
      var posts = await jobsRepository.getJobs();
      emit(JobLoadedState(jobs: posts));
    } catch (e) {
      emit(JobErrorState(message: e.toString()));
    }
  }

  _fetchAllAppliedJobs(
    FetchAppliedJobsEvent event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobLoadingState());
    try {
      var posts = await jobsRepository.getAppliedJobs();
      emit(JobLoadedState(jobs: posts));
    } catch (e) {
      emit(JobErrorState(message: e.toString()));
    }
  }
}
