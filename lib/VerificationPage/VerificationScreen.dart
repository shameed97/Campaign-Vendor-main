import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerificationScreen extends StatefulWidget {
  // const VerificationScreen({required Key key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return (true);
        },
        child: SingleChildScrollView(
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
                  child: Image.asset('assets/images/Untitled-3 1.png',
                      height: height / 3.59),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Text(
                  'Verification Code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF3C3C3C),
                    fontSize: 30,
                    // MediaQuery.of(context).size.width / 10
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'You will get a OTP via SMS',
                style: TextStyle(fontSize: 16, color: Color(0XFFA5A4A4)),
              ),
              SizedBox(
                height: height / 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: OTPTextField(
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 40,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6D6D6D)),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                    // if(pin == "1234"){
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (contexts) => locationScreen(
                    //       ),
                    //     ),
                    //   );
                    //
                    // }
                  },
                ),
              ),
              SizedBox(
                height: height / 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 17,
                width: MediaQuery.of(context).size.width / 2.1,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(10),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0XFFD10B0B)),
                      shadowColor: MaterialStateProperty.all<Color>(
                          Colors.red.withOpacity(0.5))),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (contexts) => locationScreen(
                    //     ),
                    //   ),
                    // );
                  },
                  child: Text('Next',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "Didn't Receive Anything?",
                    style: TextStyle(color: Color(0XFF7E7C7C), fontSize: 12)),
                TextSpan(text: " "),
                TextSpan(
                    text: 'Resend code',
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0XFFD10B0B),
                        fontWeight: FontWeight.bold))
              ])),
            ],
          ),
        ),
      ),
    ));
  }
}
