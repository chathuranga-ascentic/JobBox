import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_box/app/app_color.dart';
import 'package:job_box/cubits/cubits.dart';
import 'package:job_box/repositories/repositories.dart';
import 'package:job_box/screens/elements/loading.dart';
import 'package:job_box/screens/widgets/base_screen_widget.dart';
import 'package:job_box/screens/widgets/input_field.dart';
import 'package:job_box/screens/widgets/square_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreenWidget(
      appBar: AppBar(
        backgroundColor: soapStoneColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Sign Up',
          style: TextStyle(color: taupeColor, fontSize: 26),
        ),
        iconTheme: const IconThemeData(
          color: taupeColor,
        ),
      ),
      body: BlocProvider<SignupCubit>(
        create: (_) => SignupCubit(context.read<AuthRepository>()),
        child: const SignupForm(),
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.status == SignupStatus.success) {
          Navigator.of(context).pop();
        } else if (state.status == SignupStatus.error) {
          // Nothing for now.
        }
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  shape: BoxShape.circle,
                  color: soapStoneColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text('Add Photo',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: taupeColor)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  _EmailInput(),
                  const SizedBox(height: 8),
                  _PasswordInput(),
                  const SizedBox(height: 8),
                  _ReTypePasswordInput(),
                  const SizedBox(height: 30),
                  _SignupButton(),
                  const SizedBox(height: 8),
                  _LoginText(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: <Widget>[
                    const Text("By creating an account you agree to Koko's",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: taupeColor)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            child: const Text(
                              'Terms of Use',
                              style: TextStyle(
                                  fontSize: 14, color: atomicTangerinColor),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                            ),
                            onPressed: () => {}),
                        const Text("and",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: taupeColor)),
                        TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                            ),
                            child: const Text(
                              'Privacy Policy',
                              style: TextStyle(
                                  fontSize: 14, color: atomicTangerinColor),
                            ),
                            onPressed: () => {}),
                      ],
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return InputField(
          onChanged: (email) {
            context.read<SignupCubit>().emailChanged(email);
          },
          labelName: 'Email',
          hintText: 'example@mail.com',
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return InputField(
            onChanged: (password) {
              context.read<SignupCubit>().passwordChanged(password);
            },
            labelName: 'New Password',
            hintText: 'Password',
            isObsureText: true);
      },
    );
  }
}

class _ReTypePasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return InputField(
            onChanged: (password) {
              context.read<SignupCubit>().reTypepasswordChanged(password);
            },
            labelName: 'Re-type Password',
            hintText: 'Re-type Password',
            isObsureText: true);
      },
    );
  }
}

class _SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == SignupStatus.submitting
            ? buildLoading()
            : SquareButton(
                btnTitle: "Create Account",
                bgColor: atomicTangerinColor,
                textColor: whiteColor,
                onPress: () {
                  context.read<SignupCubit>().signupFormSubmitted();
                });
      },
    );
  }
}

class _LoginText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Text("Already have an account?",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: taupeColor)),
        TextButton(
            child: const Text(
              'Log In',
              style: TextStyle(fontSize: 18, color: atomicTangerinColor),
            ),
            onPressed: () => Navigator.of(context).pop())
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
