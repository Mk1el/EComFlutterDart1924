import 'package:ecommerce_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPassword extends StatelessWidget{
  const ForgotPassword({super.key});
  @override
  Widget build(BuildContext context){
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Headings
            Text(TTexts.tForgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(TTexts.tForgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSizes.spaceBtwSections *2),

            //Text Field
            TextFormField(
              decoration: const InputDecoration(labelText:TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            //Submit Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.off(()=> const ResetPassword()),child: const Text(TTexts.submit)))
          ],)
      )
    );
  }
}