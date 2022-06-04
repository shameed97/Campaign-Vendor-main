import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offers_52/LoginPage/LoginScreen.dart';
import 'package:offers_52/services/shared_preference.dart';

import '../HomePage/HomeScreen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final SharedPreference _sharedPreference = SharedPreference();
  final pageController = PageController(viewportFraction: 1.1);

  @override
  void initState() {
    super.initState();
    getValues();
  }

  getValues() async {
    bool? loginStatus = await _sharedPreference.getBool("loginStatus");
    if (loginStatus != null && loginStatus) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()), (Route<dynamic> route) => false);
    }
  }

  int currentIndex = 0;

  List<Widget> _pagesList = [
    Image.asset(
      'assets/images/Onboarding1.png',
      scale: 0.95,
    ),
    Image.asset('assets/images/Onboarding2.png', scale: 0.95),
    Image.asset('assets/images/Onboarding3.png', scale: 1),
    Image.asset('assets/images/Onboarding4.png', scale: 0.97),
  ];

  List<Widget> titles = [
    Column(
      children: [
        Text(
          "Venenatis Enim",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            constraints: BoxConstraints(maxWidth: 280),
            child: Text(
              "Donec ac lacus sit amet risus dignissim rutrum et quis purus. Quisque a velit ut purus malesuada",
              style: TextStyle(fontSize: 12, color: Color(0XFF7E7E7E), height: 1.3),
              textAlign: TextAlign.center,
            )),
      ],
    ),
    Column(
      children: [
        Text(
          "Aenean malesuada",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            constraints: BoxConstraints(maxWidth: 280),
            child: Text(
              "Donec ac lacus sit amet risus dignissim rutrum et quis purus. Quisque a velit ut purus malesuada",
              style: TextStyle(fontSize: 12, color: Color(0XFF7E7E7E), height: 1.3),
              textAlign: TextAlign.center,
            )),
      ],
    ),
    Column(
      children: [
        Text(
          "Praesent Ultrices ",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            constraints: BoxConstraints(maxWidth: 280),
            child: Text(
              "Donec ac lacus sit amet risus dignissim rutrum et quis purus. Quisque a velit ut purus malesuada",
              style: TextStyle(fontSize: 12, color: Color(0XFF7E7E7E), height: 1.3),
              textAlign: TextAlign.center,
            )),
      ],
    ),
    Column(
      children: [
        Text(
          "Aliquam Urna",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            constraints: BoxConstraints(maxWidth: 280),
            child: Text(
              "Donec ac lacus sit amet risus dignissim rutrum et quis purus. Quisque a velit ut purus malesuada",
              style: TextStyle(fontSize: 12, color: Color(0XFF7E7E7E), height: 1.3),
              textAlign: TextAlign.center,
            )),
      ],
    ),
  ];

  List<Widget> indicator = [
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Indicator(
          color: Color(0XFFFF3F3F),
        ),
        SizedBox(
          width: 5,
        ),
        Indicator(color: Color(0XFFf5cdcd)),
        SizedBox(
          width: 5,
        ),
        Indicator(color: Color(0XFFf5cdcd)),
        SizedBox(
          width: 5,
        ),
        Indicator(color: Color(0XFFf5cdcd)),
      ],
    ),
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Indicator(
          color: Color(0XFFFF3F3F),
        ),
        SizedBox(
          width: 5,
        ),
        Indicator(color: Color(0XFFFF3F3F)),
        SizedBox(
          width: 5,
        ),
        Indicator(color: Color(0XFFf5cdcd)),
        SizedBox(
          width: 5,
        ),
        Indicator(color: Color(0XFFf5cdcd)),
      ],
    ),
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Indicator(
          color: Color(0XFFFF3F3F),
        ),
        SizedBox(
          width: 5,
        ),
        Indicator(color: Color(0XFFFF3F3F)),
        SizedBox(
          width: 5,
        ),
        Indicator(color: Color(0XFFFF3F3F)),
        SizedBox(
          width: 5,
        ),
        Indicator(color: Color(0XFFf5cdcd)),
      ],
    ),
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Indicator(
          color: Color(0XFFFF3F3F),
        ),
        SizedBox(
          width: 5,
        ),
        Indicator(color: Color(0XFFFF3F3F)),
        SizedBox(
          width: 5,
        ),
        Indicator(color: Color(0XFFFF3F3F)),
        SizedBox(
          width: 5,
        ),
        Indicator(color: Color(0XFFFF3F3F)),
      ],
    ),
  ];

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Container(
                color: Color(0XFFFF3F3F),
              ),
              Positioned(
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, top: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: _pagesList.length,
                        onPageChanged: onChangedFunction,
                        itemBuilder: (BuildContext context, int index) {
                          return FractionallySizedBox(
                            widthFactor: 1 / pageController.viewportFraction,
                            child: Container(
                              child: _pagesList[currentIndex],
                            ),
                          );
                        },
                      ),
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1.7,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        child: Image.asset(
                          'assets/images/Vector 6.png',
                          fit: BoxFit.fill,
                        ),
                      ))),
              Positioned(
                  bottom: 0,
                  child: Container(
                      height: MediaQuery.of(context).size.height / 1.7,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/Vector 7.png',
                        fit: BoxFit.fill,
                      ))),
              Positioned.fill(top: height / 1.8, child: Container(child: titles[currentIndex])),
              Positioned.fill(
                top: height / 1.76,
                child: Align(child: indicator[currentIndex]),
              ),
              Positioned(
                  bottom: 40,
                  right: 40,
                  child: GestureDetector(
                    onTap: () {
                      int page = pageController.page!.toInt();
                      pageController.animateToPage(page + 1,
                          curve: Curves.fastLinearToSlowEaseIn, duration: Duration(seconds: 1));
                      if (pageController.page!.toInt() == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contexts) => LoginScreen(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          color: Color(0XFFFF3F3F)),
                      child: Center(
                          child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 25,
                        color: Colors.white,
                      )),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final color;

  const Indicator({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(100)),
    );
  }
}
