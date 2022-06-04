import 'package:flutter/material.dart';
class BuyCampaignScreen extends StatefulWidget {
  const BuyCampaignScreen({Key? key}) : super(key: key);

  @override
  _BuyCampaignScreenState createState() => _BuyCampaignScreenState();
}

class _BuyCampaignScreenState extends State<BuyCampaignScreen> {
  List<dynamic> _history = [
    {
      'title': 'Buy 10 Campaigns',
      'date': '17-11-2021',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'reducedPrice': '₹23000',
      'usualPrice': '₹25000',
    },
    {
      'title': 'Buy 1 Campaigns',
      'date': '17-11-2021',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'reducedPrice': '₹23000',
      'usualPrice': '₹25000',
    },
    {
      'title': 'Buy 1 Campaigns',
      'date': '17-11-2021',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'reducedPrice': '₹23000',
      'usualPrice': '₹25000',
    },
    {
      'title': 'Buy 1 Campaigns',
      'date': '17-11-2021',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'reducedPrice': '₹23000',
      'usualPrice': '₹25000',
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
                  padding: EdgeInsets.only(
                      top: 200, right: 20, left: 20, bottom: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: ListView.builder
                            (
                              itemCount: _history.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      width: width,
                                      decoration: BoxDecoration(
                                          gradient: index == 0 ?
                                          LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Color(0XFFF50000),
                                                Color(0XFFD16B0D),
                                              ]) : LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Color(0XFFFF4543),
                                                Color(0XFFFF805A),
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            top: 10,
                                            bottom: 5,
                                            right: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  _history[index]["title"],
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              constraints:
                                                  BoxConstraints(maxWidth: 191),
                                              child: Text(
                                                _history[index]["description"],
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.white,
                                                    height: 1.5),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  _history[index]["reducedPrice"],
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  _history[index]["usualPrice"],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.white,
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                                Spacer(),
                                                ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        primary:
                                                            Color(0XFFEBEBEB),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            17.5))),
                                                    onPressed: () {},
                                                    child: Text(
                                                      "Buy Now",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              Color(0XFF262626)),
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20)
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    child: Image.asset("assets/images/Ellipse 3.png",fit: BoxFit.fill,width: width,)),
                Positioned(
                    top: 0,
                    child: Image.asset("assets/images/Ellipse 2.png",fit: BoxFit.fill,width: width,)),
                Positioned(
                    top: 0,
                    child: Image.asset("assets/images/Ellipse 1.png",fit: BoxFit.fill,width: width,)),
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
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          "Buy Campaigns",
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
