import 'package:flutter/material.dart';
import 'package:wheelsndeels/UI/components/roundButton.dart';
import 'package:wheelsndeels/UI/constants/app_textStyle.dart';

import '../components/customtextfield.dart';
import '../components/keybord_hider.dart';
import '../constants/images.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String signupOption = 'email';
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool termsAccepted = false;
  bool obSText = false;
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
                  // const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back,',
                          style: AppTextStyle.headline2Black(context),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Please enter your details',
                          style: AppTextStyle.bodyText2(context),
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
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: 'Name',
                                controller: nameController,
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  size: 18,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: CustomTextField(
                                hintText: 'Last Name',
                                controller: lastNameController,
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                        CustomTextField(
                          hintText: 'Password',
                          controller: passwordController,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            size: 18,
                          ),
                          obscurText: obSText,
                          sufixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obSText = !obSText;
                                });
                              },
                              icon: Icon(obSText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined)),
                        ),
                        CustomTextField(
                          hintText: 'Confirm Password',
                          controller: confirmPasswordController,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            size: 18,
                          ),
                          obscurText: obSText,
                          sufixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obSText = !obSText;
                                });
                              },
                              icon: Icon(obSText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined)),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: termsAccepted,
                              onChanged: (value) {
                                setState(() {
                                  termsAccepted = value!;
                                });
                              },
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: 'By signing up, you agree to our ',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(text: ' and '),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Center(
                            child:
                                RoundButton(title: "Register", onTap: () {})),
                        SizedBox(height: 40),
                        GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Alredy have an account? ',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: 'Sign In',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
