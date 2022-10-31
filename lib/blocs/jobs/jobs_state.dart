part of 'jobs_bloc.dart';

abstract class JobsState extends Equatable {}

class JobInitialState extends JobsState {
  @override
  List<Object> get props => [];
}

class JobLoadingState extends JobsState {
  @override
  List<Object> get props => [];
}

class JobLoadedState extends JobsState {
  final List<Jobs> jobs;
  JobLoadedState({required this.jobs});
  @override
  List<Object> get props => [jobs];
}

class JobErrorState extends JobsState {
  final String message;
  JobErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
