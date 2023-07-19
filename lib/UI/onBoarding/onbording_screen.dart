import 'package:flutter/material.dart';
import 'package:wheelsndeels/UI/components/roundButton.dart';

import '../constants/app_textStyle.dart';
import '../constants/images.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                "Find the best car\nwithout headaches",
                style: AppTextStyle.headline2(context),
              ),
              const SizedBox(height: 10),
              Text(
                "You choose your car online.We inspect it\n and deliver it.",
                style: AppTextStyle.bodyText1(context)
                    .copyWith(color: Colors.white.withOpacity(0.5)),
              ),
              const Spacer(),
              Center(
                child: RoundButton(
                  title: 'Get Started',
                  onTap: () {
                    Navigator.pushNamed(context, '/registration');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
