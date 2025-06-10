import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:tasktracker/pages/home.dart';
import 'package:tasktracker/services/auth_services.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  AuthServices authServices = AuthServices();
  bool isSendingData = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildItem("Sign up Google", () async {
                authServices.googleSignIn(context);
              }),
              SizedBox(
                height: 20,
              ),
              buildItem("Sign up Mobile", () {}),
              SizedBox(
                height: 20,
              ),
              Text(
                "Or",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              textField("Email", false, _emailController),
              SizedBox(
                height: 20,
              ),
              textField("Password", true, _pwdController),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                      minimumSize: Size(200, 50)),
                  onPressed: () async {
                    try {
                      setState(() {
                        isSendingData = true;
                      });
                      firebase_auth.UserCredential userCredential =
                          await firebaseAuth.createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _pwdController.text);
                     
                      setState(() {
                        isSendingData = false;
                      });
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                          (route) => false);
                    } catch (e) {
                      final snackbar = SnackBar(content: Text(e.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      setState(() {
                        isSendingData = false;
                      });
                    }
                  },
                  child: isSendingData
                      ? CircularProgressIndicator()
                      : Text("Continue",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem(String lableText, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width - 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: Center(
          child: Text(
            lableText,
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget textField(
      String labelText, bool obscure, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white, width: 2)),
      ),
    );
  }
}
