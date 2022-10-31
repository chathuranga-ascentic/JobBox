part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String email;
  final String password;
  final String reTypePassword;
  final SignupStatus status;

  const SignupState({
    required this.email,
    required this.password,
    required this.reTypePassword,
    required this.status,
  });

  factory SignupState.initial() {
    return const SignupState(
      email: '',
      password: '',
      reTypePassword: '',
      status: SignupStatus.initial,
    );
  }

  SignupState copyWith({
    String? email,
    String? password,
    String? reTypePassword,
    SignupStatus? status,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      reTypePassword: reTypePassword ?? this.reTypePassword,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, reTypePassword, status];
}
