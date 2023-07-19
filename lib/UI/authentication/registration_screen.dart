import 'package:flutter/material.dart';

import '../components/customtextfield.dart';
import '../components/keybord_hider.dart';

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

  @override
  Widget build(BuildContext context) {
    return KeyboardHider(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Signup'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Signup Option:'),
                Row(
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
                const SizedBox(height: 16.0),
                CustomTextField(hintText: 'Name', controller: emailController),
                const SizedBox(height: 10.0),
                CustomTextField(
                    hintText: 'Last Name', controller: emailController),
                const SizedBox(height: 10.0),
                if (signupOption == 'email')
                  CustomTextField(
                      hintText: 'Email', controller: emailController),
                if (signupOption == 'mobile')
                  CustomTextField(
                      hintText: 'Mobile', controller: emailController),
                const SizedBox(height: 10.0),
                CustomTextField(
                    hintText: 'Password', controller: emailController),
                const SizedBox(height: 10.0),
                CustomTextField(
                    hintText: 'Confirm Password', controller: emailController),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Perform signup logic here
                  },
                  child: const Text('Signup'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
