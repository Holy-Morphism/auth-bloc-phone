import 'package:bloc_phone_auth/cubit/auth_cubit.dart';
import 'package:bloc_phone_auth/cubit/auth_state.dart';
import 'package:bloc_phone_auth/screens/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedOutState) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignInScreen()));
        }
      },
      builder: (context, state) {
        if (state is AuthLoggedInState) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).signOut();
              },
              child: const Icon(Icons.exit_to_app),
            ),
            body: const Center(
              child: Text('Home Screen'),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
