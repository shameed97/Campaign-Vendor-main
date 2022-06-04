import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:offers_52/HomePage/BuyCampaignScreen.dart';
import 'package:offers_52/HomePage/CampaignsStatistics.dart';
import 'package:offers_52/HomePage/CreateCampaignsScreen.dart';
import 'package:offers_52/HomePage/ProfileScreen/ProfileScreen.dart';
import 'package:offers_52/HomePage/ProfileScreen/TransactionHistoryScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Container(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 180, bottom: 0),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (contexts) =>
                                              CreateCampaignsScreen(route: 'homeScreen',),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 20,
                                          bottom: 20),
                                      height: 200,
                                      width: width / 2.5,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Color(0XFFDADADA)),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(30)),
                                        boxShadow: [
                                          CustomBoxShadow(
                                              color: Color(0XFFDC3232)
                                                  .withOpacity(0.2),
                                              offset: Offset(0.0, 0.0),
                                              blurRadius: 10.0,
                                              blurStyle: BlurStyle.outer)
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Create Campaigns",
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                                color: Colors.black),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Image.asset("assets/images/idea 1.png")
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (contexts) =>
                                              BuyCampaignScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 20,
                                          bottom: 20),
                                      height: 200,
                                      width: width / 2.5,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Color(0XFFDADADA)),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(30)),
                                        boxShadow: [
                                          CustomBoxShadow(
                                              color: Color(0XFFDC3232)
                                                  .withOpacity(0.2),
                                              offset: Offset(0.0, 0.0),
                                              blurRadius: 10.0,
                                              blurStyle: BlurStyle.outer)
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Buy Campaigns",
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                                color: Colors.black),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Image.asset(
                                              "assets/images/campaign 1.png")
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(top: 60),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (contexts) =>
                                                CampaignsStatisticsScreen(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 20,
                                            bottom: 20),
                                        height: 200,
                                        width: width / 2.5,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0XFFDADADA)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          boxShadow: [
                                            CustomBoxShadow(
                                                color: Color(0XFFDC3232)
                                                    .withOpacity(0.2),
                                                offset: Offset(0.0, 0.0),
                                                blurRadius: 10.0,
                                                blurStyle: BlurStyle.outer)
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Campaigns Statistics",
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Image.asset(
                                                "assets/images/campaign.png")
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (contexts) =>
                                                TransactionScreen(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 20,
                                            bottom: 20),
                                        height: 200,
                                        width: width / 2.5,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0XFFDADADA)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          boxShadow: [
                                            CustomBoxShadow(
                                                color: Color(0XFFDC3232)
                                                    .withOpacity(0.2),
                                                offset: Offset(0.0, 0.0),
                                                blurRadius: 10.0,
                                                blurStyle: BlurStyle.outer)
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Transaction History",
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Image.asset(
                                                "assets/images/campaign (1) 1.png")
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    child: Image.asset(
                      "assets/images/Ellipse 3.png",
                      fit: BoxFit.fill,
                      width: width,
                    )),
                Positioned(
                    top: 0,
                    child: Image.asset(
                      "assets/images/Ellipse 2.png",
                      fit: BoxFit.fill,
                      width: width,
                    )),
                Positioned(
                    top: 0,
                    child: Image.asset(
                      "assets/images/Ellipse 1.png",
                      fit: BoxFit.fill,
                      width: width,
                    )),
                Positioned(
                  top: 10,
                  right: 20,
                  child: IconButton(
                    icon: Image.asset("assets/images/user.png"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contexts) => ProfileScreen(),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                    top: 70,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Lorem ipsum",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 26,
                                color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBoxShadow extends BoxShadow {
  final BlurStyle blurStyle;

  const CustomBoxShadow({
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    this.blurStyle = BlurStyle.normal,
  }) : super(color: color, offset: offset, blurRadius: blurRadius);

  @override
  Paint toPaint() {
    final Paint result = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(this.blurStyle, blurSigma);
    assert(() {
      if (debugDisableShadows) result.maskFilter = null;
      return true;
    }());
    return result;
  }
}
