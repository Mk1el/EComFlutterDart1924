import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ResetPassword extends StatelessWidget{
  const ResetPassword({super.key});
  @override
  Widget build(BuildContext context){
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.back(), icon: const Icon(CupertinoIcons.clear))
        ]
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Image
              Image(
                image:  AssetImage(
                  dark ?TImages.lightAppLogo :TImages.darkAppLogo ),
                  width:THelperFunctions.screenWidth()*0.6),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Title and Subtitle
              Text(TTexts.resetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(TTexts.resetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Buttons
              SizedBox(
                width: double.infinity,
                child:ElevatedButton(onPressed: (){}, child: const Text(TTexts.done))
                ),
                 const SizedBox(height: TSizes.spaceBtwItems),
                 SizedBox(
                  width: double.infinity,
                  child: TextButton(onPressed: (){}, child: const Text(TTexts.resendEmail))
                 )
            ],
            ),
           )
      ));
  }
}