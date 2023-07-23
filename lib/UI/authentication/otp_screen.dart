import 'package:flutter/material.dart';

import '../components/keybord_hider.dart';
import '../components/roundButton.dart';
import '../constants/app_textStyle.dart';
import '../constants/images.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key, required this.signupOption});
  String signupOption;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
                        Image.asset(otpLogo),
                        Text(
                          'Almost there!',
                          style: AppTextStyle.headline2Black(context),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.signupOption == "email"
                              ? '   Check your email inbox and input the\nverification code to verify your account.'
                              : '   Check your messages inbox and input\n the verification code to verify your account.',
                          textAlign: TextAlign.justify,
                          style: AppTextStyle.bodyText2Black(context).copyWith(
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 35),
                        OtpTextField(
                          numberOfFields: 5,
                          borderColor: Colors.red,
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          fillColor: Colors.grey.withOpacity(0.2),
                          filled: true,
                          fieldWidth: 60,
                          borderRadius: BorderRadius.circular(15),

                          // enabledBorderColor: Colors.red,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Verification Code"),
                                    content: Text(
                                        'Code entered is $verificationCode'),
                                  );
                                });
                          }, // end onSubmit
                        ),
                        SizedBox(height: 300),
                        Center(
                            child: RoundButton(
                                title: "Reset password",
                                onTap: () {
                                  Navigator.pushNamed(context, "/newPass");
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
