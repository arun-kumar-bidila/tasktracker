import 'package:flutter/material.dart';
import 'package:tasktracker/auth/screens/signin_screen.dart';
import 'package:tasktracker/auth/services/authServices.dart';
import 'package:tasktracker/common/custom_button.dart';
import 'package:tasktracker/common/custom_textfield.dart';
import 'package:tasktracker/constants/global_variables.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = "/signup-screen";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Authservices authservices = Authservices();
  final _signupFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: GlobalVariables.buttonColor,
        title: Text(
          "Create Account",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Account",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Please register on our TaskTracker , where you can continue using our service",
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _signupFormKey,
              child: Column(
                children: [
                  CustomTextfield(controller: nameController, hintText: "Name"),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                      controller: userNameController, hintText: "User Name"),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              label: "Continue",
              onTap: () {
                if (_signupFormKey.currentState!.validate()) {
                  authservices.signupUser(
                      context: context,
                      name: nameController.text,
                      userName: userNameController.text,
                      password: passwordController.text);
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have An Account ? ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, SigninScreen.routeName, (route) => false);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: GlobalVariables.buttonColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: GlobalVariables.buttonColor),
                    )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
