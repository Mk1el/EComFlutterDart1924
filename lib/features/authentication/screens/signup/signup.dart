import 'package:ecommerce_app/common/styles/spacing_styles.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/signupwidgets/signup_form.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/signupwidgets/signup_header.dart';

import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TSignupHeader(),
              TSignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}
