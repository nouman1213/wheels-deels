import 'package:flutter/material.dart';

import '../components/customtextfield.dart';
import '../components/keybord_hider.dart';
import '../components/roundButton.dart';
import '../constants/app_textStyle.dart';
import '../constants/images.dart';

class ResetPassScreen extends StatefulWidget {
  ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  String signupOption = 'email';

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardHider(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Opacity(
                opacity: 0.1,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Opacity(
                    opacity: 0.1,
                    child: Image.asset(
                      bgLogo,
                      scale: 1,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(cantSignLogo),
                        Text(
                          'Can\'t sign in?',
                          style: AppTextStyle.headline2Black(context),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '      Enter the email or phone number\n associated with your account to reset\n                       your password.',
                          textAlign: TextAlign.justify,
                          style: AppTextStyle.bodyText2Black(context).copyWith(
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                              value: 'email',
                              groupValue: signupOption,
                              onChanged: (value) {
                                setState(() {
                                  signupOption = value!;
                                });
                              },
                            ),
                            const Text('Email'),
                            const SizedBox(width: 50),
                            Radio(
                              value: 'mobile',
                              groupValue: signupOption,
                              onChanged: (value) {
                                setState(() {
                                  signupOption = value!;
                                });
                              },
                            ),
                            const Text('Mobile'),
                          ],
                        ),
                        const SizedBox(height: 15),
                        if (signupOption == 'email')
                          CustomTextField(
                            hintText: 'Email',
                            controller: emailController,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              size: 18,
                            ),
                          ),
                        if (signupOption == 'mobile')
                          CustomTextField(
                            hintText: 'Mobile',
                            controller: mobileController,
                            prefixIcon: Icon(
                              Icons.phone,
                              size: 18,
                            ),
                          ),
                        SizedBox(height: 240),
                        Center(
                            child: RoundButton(
                                title: "Reset password",
                                onTap: () {
                                  Navigator.pushNamed(context, "/otpScreen",
                                      arguments: signupOption);
                                })),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
