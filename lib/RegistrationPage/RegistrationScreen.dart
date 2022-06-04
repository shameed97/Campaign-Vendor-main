import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:offers_52/HomePage/HomeScreen.dart';
import 'package:offers_52/widgets/custom_displays.dart';

import '../services/shared_preference.dart';
import '../widgets/error_dialog.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool password = true;
  bool retypePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final SharedPreference _sharedPreference = SharedPreference();


  Future<void> signUpFormValidation() async {
    if (passwordController.text == confirmPasswordController.text) {
      if (confirmPasswordController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          nameController.text.isNotEmpty &&
          phoneController.text.isNotEmpty) {
        sellerSignUp();
      }
      //if there is empty place show this message
      else {
        CustomDisplays.showToast(msg: "Please fill all the fields", context: context);
      }
    } else {
      CustomDisplays.showToast(msg: "Password did not match", context: context);
    }
  }

  void sellerSignUp() async {
    CustomDisplays.showProgress(context);
    User? currentUser;
    await firebaseAuth
        .createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user;
    }).catchError(
      (error) {
        CustomDisplays.closeDialog(context);
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: error.message.toString(),
            );
          },
        );
      },
    );

    if (currentUser != null) {
      saveDataToFirestore(currentUser!).then((value) {
        CustomDisplays.closeDialog(context);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false);
      });
    }
  }

  //saving seller information to firestore
  Future saveDataToFirestore(User currentUser) async {
    FirebaseFirestore.instance.collection("sellers").doc(currentUser.uid).set(
      {
        "sellerUID": currentUser.uid,
        "sellerEmail": currentUser.email,
        "sellerName": nameController.text.trim(),
        "phone": phoneController.text.trim(),
        "status": "approved",
        "earnings": 0.0,
      },
    );

    // save data locally (to access data easly from phone storage)
    _sharedPreference.save("uid", currentUser.uid);
    _sharedPreference.save("email", currentUser.email.toString());
    _sharedPreference.save("name", nameController.text.trim());
    _sharedPreference.save("phone", phoneController.text);
    _sharedPreference.saveBool("loginStatus", true);
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
                    'Register',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF3C3C3C),
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: nameController,
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
                        hintText: 'Name',
                        hintStyle: TextStyle(color: Color(0XFF7C7979), fontSize: 14),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                        prefixIcon: Icon(
                          Icons.mail_outlined,
                          color: Colors.black38.withOpacity(0.3),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Color(0XFF7C7979), fontSize: 14),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
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
                          AssetImage('assets/images/telephone.png'),
                          color: Colors.black54,
                        ),
                        hintText: 'Telephone',
                        hintStyle: TextStyle(color: Color(0XFF7C7979), fontSize: 14),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField(
                    obscureText: password,
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
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(color: Color(0XFF7C7979), fontSize: 14),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (password == false) {
                                  password = true;
                                } else {
                                  password = false;
                                }
                              });
                            },
                            icon: password == false
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
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField(
                    controller: confirmPasswordController,
                    obscureText: retypePassword,
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
                        hintText: 'Retype Password',
                        hintStyle: TextStyle(color: Color(0XFF7C7979), fontSize: 14),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (retypePassword == false) {
                                  retypePassword = true;
                                } else {
                                  retypePassword = false;
                                }
                              });
                            },
                            icon: retypePassword == false
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
                    height: MediaQuery.of(context).size.height / 16,
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(10),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0XFFD10B0B)),
                          shadowColor: MaterialStateProperty.all<Color>(Colors.red.withOpacity(0.5))),
                      onPressed: () {
                       if(_formKey.currentState!.validate()){
                         signUpFormValidation();
                       }
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
