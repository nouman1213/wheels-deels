import 'package:flutter/material.dart';
import 'package:wheelsndeels/UI/components/roundButton.dart';
import 'package:wheelsndeels/UI/constants/app_textStyle.dart';

import '../components/customtextfield.dart';
import '../components/keybord_hider.dart';
import '../constants/images.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool obSText = false;

  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 300, // Set the specific height you want
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                Image.asset(passChangeLogo),
                Text(
                  'Password changed!',
                  style: AppTextStyle.headline2Black(context),
                ),
                const SizedBox(height: 5),
                Text(
                  'Awesome. You’re successfully updated\n                   your password.',
                  style: AppTextStyle.bodyText2Black(context),
                ),
                const SizedBox(height: 25),
                Center(
                    child: RoundButton(
                        title: "Return to Sign In",
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        })),
              ],
            ),
          ),
        );
      },
    );
  }

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
                          'Create your\nnew password',
                          style: AppTextStyle.headline2Black(context),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Your new password must be different\nfrom previous password.',
                          style: AppTextStyle.bodyText2Black(context),
                        ),
                        const SizedBox(height: 25),
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
                        SizedBox(height: 340),
                        Center(
                            child: RoundButton(
                                title: "Create new password",
                                onTap: () {
                                  _showCustomBottomSheet(context);
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
