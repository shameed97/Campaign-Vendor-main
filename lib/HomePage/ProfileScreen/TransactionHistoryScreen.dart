import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:offers_52/HomePage/CreateCampaignsScreen.dart';
import '../BuyCampaignScreen.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  List<dynamic> _history = [
    {
      'title': '10 Campaign Purchased',
      'date': '17-11-2021',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'reducedPrice': '₹23000',
    },
    {
      'title': '5 Campaign Purchased',
      'date': '17-11-2021',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'reducedPrice': '₹18000',
    },
    {
      'title': '3 Campaign Purchased',
      'date': '17-11-2021',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'reducedPrice': '₹15000',
    },
    {
      'title': '3 Campaign Purchased',
      'date': '17-11-2021',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'reducedPrice': '₹15000',
    },
  ];

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
                    left: 20,
                    right: 20,
                    top: 200,
                  ),
                  child: Column(
                    children: [
                      Container(
                        // height: height/3,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color(0XFFF50000),
                                  Color(0XFFD16B0D),
                                ]),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      constraints:
                                          BoxConstraints(maxWidth: 200),
                                      child: Text(
                                        "Available campaigns",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 24,
                                            color: Colors.white,
                                            height: 1),
                                      )),
                                  Spacer(),
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              spreadRadius: 0.0,
                                              blurRadius: 14.0,
                                              offset: Offset(0.0, 4.0))
                                        ],
                                        gradient: LinearGradient(
                                            begin: Alignment
                                                .topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0XFFFFFFFF),
                                              Color(0XFFF3F3F3),
                                            ]),
                                        borderRadius:
                                        BorderRadius.circular(
                                            60)),
                                    child: Center(
                                      child: Text(
                                        "10",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight:
                                            FontWeight.w600,
                                            color: Color(0XFFF50000)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              // Spacer(),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (contexts) =>
                                              BuyCampaignScreen(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0XFFEBEBEB),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(17.5)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Buy Campaigns",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0XFF262626),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (contexts) =>
                                              CreateCampaignsScreen(
                                            route: "history",
                                          ),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0XFFEBEBEB),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(17.5)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Create Campaigns",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0XFF262626),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        // height: height/3,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color(0XFFF50000),
                                  Color(0XFFD16B0D),
                                ]),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      constraints:
                                          BoxConstraints(maxWidth: 200),
                                      child: Text(
                                        "Finished campaigns",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 24,
                                            color: Colors.white,
                                            height: 1),
                                      )),
                                  Spacer(),
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              spreadRadius: 0.0,
                                              blurRadius: 14.0,
                                              offset: Offset(0.0, 4.0))
                                        ],
                                        gradient: LinearGradient(
                                            begin: Alignment
                                                .topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0XFFFFFFFF),
                                              Color(0XFFF3F3F3),
                                            ]),
                                        borderRadius:
                                        BorderRadius.circular(
                                            60)),
                                    child: Center(
                                      child: Text(
                                        "06",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight:
                                            FontWeight.w600,
                                            color: Color(0XFFF50000)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: _history.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 20),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print("$index");
                                    },
                                    child: Material(
                                      elevation: 1,
                                      borderRadius: BorderRadius.circular(10),
                                      shadowColor: Colors.black,
                                      child: Container(
                                        width: width,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0XFFEFEFEF),
                                                  Color(0XFFE8E8E8),
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  blurRadius: 2.0,
                                                  offset: Offset(0.0, 6.0))
                                            ],
                                            border: Border.all(
                                                color: Color(0XFFD2D2D2),
                                                width: 1)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _history[index]["title"],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17,
                                                        color:
                                                            Color(0XFF5C5C5C)),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    _history[index]
                                                        ["reducedPrice"],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 19,
                                                        color:
                                                            Color(0XFFF50000)),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 0,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      constraints:
                                                          BoxConstraints(
                                                              maxWidth: 191),
                                                      child: Text(
                                                        _history[index]
                                                            ["description"],
                                                        style: TextStyle(
                                                            fontSize: 9,
                                                            color: Color(
                                                                0XFF606060)),
                                                      )),
                                                  Spacer(),
                                                  Text(
                                                    _history[index]["date"],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 9,
                                                        color:
                                                            Color(0XFF454444)),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20)
                                ],
                              );
                            }),
                      ),
                    ],
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
                  top: 20,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          "assets/images/back.png",
                          height: 25,
                          width: 25,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "Transaction History",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 26,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
