import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:offers_52/HomePage/HomeScreen.dart';
import 'package:offers_52/RegistrationPage/RegistrationScreen.dart';

import '../services/shared_preference.dart';
import '../widgets/custom_displays.dart';
import '../widgets/error_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final SharedPreference _sharedPreference = SharedPreference();

  formValidation() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      loginNow();
    } else {
      CustomDisplays.showToast(msg: "Please fill all the fields", context: context);
    }
  }

//login function
  loginNow() async {
    CustomDisplays.showProgress(context);

    User? currentUser;
    await firebaseAuth
        .signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then(
      (auth) {
        currentUser = auth.user!;
      },
    ).catchError((error) {
      CustomDisplays.closeDialog(context);
      showDialog(
        context: context,
        builder: (c) {
          return ErrorDialog(
            message: error.message.toString(),
          );
        },
      );
    });
    if (currentUser != null) {
      readDataAndSetDataLocally(currentUser!);
    }
  }

  Future readDataAndSetDataLocally(User currentUser) async {
    await FirebaseFirestore.instance.collection("sellers").doc(currentUser.uid).get().then(
      (snapshot) async {
        //check if the user is seller
        if (snapshot.exists) {
          if (snapshot.data()!["status"] == "approved") {
            _sharedPreference.save("uid", currentUser.uid);
            _sharedPreference.save("email", snapshot.data()!["sellerEmail"]);
            _sharedPreference.save("name", snapshot.data()!["sellerName"]);
            _sharedPreference.save("phone", snapshot.data()!["phone"]);
            _sharedPreference.saveBool("loginStatus", true);
            CustomDisplays.closeDialog(context);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false);
          } else {
            CustomDisplays.closeDialog(context);
            firebaseAuth.signOut();

            CustomDisplays.showToast(msg: "Your Account has been blocked", context: context);
          }
        }
        //if user is not a seller
        else {
          CustomDisplays.closeDialog(context);
          CustomDisplays.showToast(msg: "No record exit", context: context);
          firebaseAuth.signOut();

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (Route<dynamic> route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return (true);
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(350),
                      bottomLeft: Radius.circular(350),
                    ),
                    color: Color(0XFFFFE4E4),
                    shape: BoxShape.rectangle,
                  ),
                  height: MediaQuery.of(context).size.height / 2.9,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/offerslogo.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF3C3C3C),
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: Color(0XFFEDE1E1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: Color(0XFFEDE1E1)),
                        ),
                        fillColor: Color(0XFFF2EDED),
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                        prefixIcon: ImageIcon(
                          AssetImage('assets/images/usericon.png'),
                          color: Colors.black,
                        ),
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Color(0XFF7C7979), fontSize: 14),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: TextFormField(
                    obscureText: obscureText,
                    controller: passwordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: Color(0XFFEDE1E1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: Color(0XFFEDE1E1)),
                        ),
                        fillColor: Color(0XFFF2EDED),
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                        prefixIcon: ImageIcon(
                          AssetImage('assets/images/passwordicon.png'),
                          color: Colors.black,
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Color(0XFF7C7979), fontSize: 14),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (obscureText == false) {
                                  obscureText = true;
                                } else {
                                  obscureText = false;
                                }
                              });
                            },
                            icon: obscureText == false
                                ? Icon(
                                    Icons.visibility_rounded,
                                    color: Colors.black45,
                                  )
                                : Icon(
                                    Icons.visibility_off_rounded,
                                    color: Colors.black45,
                                  )),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 17,
                    width: MediaQuery.of(context).size.width / 2.1,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(10),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0XFFD10B0B)),
                          shadowColor: MaterialStateProperty.all<Color>(Colors.red.withOpacity(0.5))),
                      onPressed: () {
                       if(_formKey.currentState!.validate()){
                         formValidation();
                       }
                      },
                      child: Text('Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 18, 20, 0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 17,
                    width: MediaQuery.of(context).size.width / 2.1,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(10),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0XFF313131)),
                          shadowColor: MaterialStateProperty.all<Color>(Colors.red.withOpacity(0.5))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contexts) => RegistrationScreen(),
                          ),
                        );
                      },
                      child: Text('Register',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
