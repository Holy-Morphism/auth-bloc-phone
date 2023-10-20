import 'package:bloc_phone_auth/cubit/auth_cubit.dart';
import 'package:bloc_phone_auth/cubit/auth_state.dart';
import 'package:bloc_phone_auth/screens/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final TextEditingController phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: phoneNumber,
              decoration: InputDecoration(
                labelText: 'Phone 📞',
                hintText: 'Your phone number',
                hintStyle: const TextStyle(color: Colors.blue),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    width: 3,
                    color: Colors.blueAccent,
                  ),
                ),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    width: 3,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthCodeSentState) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OTPScreen()));
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                      color: Colors.blue,
                      child: const Text('Sign In'),
                      onPressed: () {
                        final String num = '+92${phoneNumber.text}';
                        BlocProvider.of<AuthCubit>(context).sendOTP(num);
                      }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
