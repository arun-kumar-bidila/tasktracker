import 'package:flutter/material.dart';
import 'package:tasktracker/auth/screens/signup_screen.dart';
import 'package:tasktracker/common/custom_button.dart';
import 'package:tasktracker/common/custom_textfield.dart';
import 'package:tasktracker/constants/global_variables.dart';

class SigninScreen extends StatefulWidget {
  static const String routeName = "/signin-screen";
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: GlobalVariables.buttonColor,
        title: Text(
          "Login",
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
              "Login",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Please login on our TaskTracker , where you can continue using our service",
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
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
            SizedBox(
              height: 20,
            ),
            CustomButton(label: "Continue",onTap: (){
               Navigator.pushNamedAndRemoveUntil(
                          context, SignupScreen.routeName, (route) => false);
            },),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't Have An Account ? ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                InkWell(
                  onTap: (){
                     Navigator.pushNamedAndRemoveUntil(
                          context, SignupScreen.routeName, (route) => false);
                  },
                    child: Text(
                  "Create Account",
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
