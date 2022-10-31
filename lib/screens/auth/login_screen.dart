import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_box/app/app_color.dart';
import 'package:job_box/cubits/cubits.dart';
import 'package:job_box/repositories/repositories.dart';
import 'package:job_box/screens/elements/loading.dart';
import 'package:job_box/screens/screens.dart';
import 'package:job_box/screens/widgets/base_screen_widget.dart';
import 'package:job_box/screens/widgets/input_field.dart';
import 'package:job_box/screens/widgets/square_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginScreen());

  @override
  Widget build(BuildContext context) {
    return BaseScreenWidget(
      body: BlocProvider(
        create: (_) => LoginCubit(context.read<AuthRepository>()),
        child: const LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Something went wrong!'),
            backgroundColor: beanRedColor,
          ));
        }
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        fontSize: 45.0,
                        color: atomicTangerinColor,
                        fontWeight: FontWeight.w600),
                    children: <TextSpan>[
                      TextSpan(text: 'Job'),
                      TextSpan(
                          text: 'box', style: TextStyle(color: taupeColor)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  _EmailInput(),
                  const SizedBox(height: 8),
                  _PasswordInput(),
                  const SizedBox(height: 8),
                  const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: taupeColor),
                  ),
                  const SizedBox(height: 30),
                  _LoginButton(),
                  const SizedBox(height: 8),
                  _SignupText(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return InputField(
          onChanged: (email) {
            context.read<LoginCubit>().emailChanged(email);
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
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return InputField(
            onChanged: (password) {
              context.read<LoginCubit>().passwordChanged(password);
            },
            labelName: 'Password',
            hintText: 'Password',
            isObsureText: true);
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LoginStatus.submitting
            ? buildLoading()
            : SquareButton(
                btnTitle: "Login",
                bgColor: atomicTangerinColor,
                textColor: whiteColor,
                onPress: () {
                  context.read<LoginCubit>().logInWithCredentials();
                });
      },
    );
  }
}

class _SignupText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Text("Don't have an account?",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: taupeColor)),
        TextButton(
          child: const Text(
            'Sign UP',
            style: TextStyle(fontSize: 18, color: atomicTangerinColor),
          ),
          onPressed: () =>
              Navigator.of(context).push<void>(SignupScreen.route()),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
