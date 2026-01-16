import 'package:ecommerce_app/common/widgets_login_signup/form_divider.dart';
import 'package:ecommerce_app/common/widgets_login_signup/social_buttons.dart';
import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

class TSignupForm extends StatefulWidget {
  const TSignupForm({super.key});

  @override
  State<TSignupForm> createState() => _TSignupFormState();
}

class _TSignupFormState extends State<TSignupForm> {
  final _formKey = GlobalKey<FormState>();

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      debugPrint("Signup successful");
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          /// First Name
          TextFormField(
            controller: _firstName,
            decoration: const InputDecoration(
              labelText: TTexts.firstName,
              prefixIcon: Icon(Iconsax.user),
            ),
            validator: (value) =>
                value == null || value.isEmpty ? 'First name is required' : null,
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Last Name
          TextFormField(
            controller: _lastName,
            decoration: const InputDecoration(
              labelText: TTexts.lastName,
              prefixIcon: Icon(Iconsax.user),
            ),
            validator: (value) =>
                value == null || value.isEmpty ? 'Last name is required' : null,
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            decoration: InputDecoration(
              labelText: TTexts.userName,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Email is required';
              if (!value.contains('@')) return 'Enter a valid email';
              return null;
            },
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Password
          TextFormField(
            controller: _password,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: TTexts.password,
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Iconsax.eye_slash : Iconsax.eye,
                ),
                onPressed: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Password is required';
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Terms
          Row(
            children: [
              Checkbox(value: true, onChanged: (_) {}),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: TTexts.tAgreewithTerms,
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                      text: TTexts.privacyPolicy,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color:
                                dark ? TColors.white : TColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    TextSpan(
                        text: TTexts.termsOfUse,
                        style: Theme.of(context).textTheme.bodySmall),
                  ]),
                ),
              )
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(()=> const VerifyEmailScreen()),
              child: const Text(TTexts.tSignup),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          /// Login Link
          Text.rich(
            TextSpan(children: [
              TextSpan(
                text: "Already have an account? ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: "Login",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                    ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const LoginScreen()),
                    );
                  },
              ),
            ]),
          ),

          const SizedBox(height: TSizes.spaceBtwSections),
          TFormDivider(dividerText: TTexts.tSignup),
          const SizedBox(height: TSizes.spaceBtwItems),
          const TSocialButtons(),
        ],
      ),
    );
  }
}
