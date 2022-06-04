import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// const double borderRadius = 25.0;

class CampaignsStatisticsScreen extends StatefulWidget {
  const CampaignsStatisticsScreen({Key? key}) : super(key: key);

  @override
  _CampaignsStatisticsScreenState createState() =>
      _CampaignsStatisticsScreenState();
}

class _CampaignsStatisticsScreenState extends State<CampaignsStatisticsScreen> {
  final _pageController = PageController(viewportFraction: 1.1);
  int activePageIndex = 0;

  onChangedFunction(int index) {
    setState(() {
      activePageIndex = index;
    });
  }
  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController(viewportFraction: 1.1);
  // }

  bool activeCampaigns = true;
  bool closedCampaigns = false;


  List<dynamic> _active = [
    {
      'image': 'assets/images/narzo.png',
      'title': 'Realme Narzo 50A 128GBRedColor',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum leo quis pellentesque scelerisque.',
      'id': '#OFS238465',
      'like': '101',
      'disLike': '20',
      'messages': '400',
      'views': '400',
      'calls': '500',
      'directions': '300',
    },
    {
      'image': 'assets/images/narzo.png',
      'title': 'Realme Narzo 50A 128GBRedColor',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum leo quis pellentesque scelerisque.',
      'id': '#OFS238466',
      'like': '101',
      'disLike': '20',
      'messages': '400',
      'views': '400',
      'calls': '500',
      'directions': '300',
    },
    {
      'image': 'assets/images/narzo.png',
      'title': 'Realme Narzo 50A 128GBRedColor',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum leo quis pellentesque scelerisque.',
      'id': '#OFS238467',
      'like': '101',
      'disLike': '20',
      'messages': '400',
      'views': '400',
      'calls': '500',
      'directions': '300',
    },
    {
      'image': 'assets/images/narzo.png',
      'title': 'Realme Narzo 50A 128GBRedColor',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum leo quis pellentesque scelerisque.',
      'id': '#OFS238468',
      'like': '101',
      'disLike': '20',
      'messages': '400',
      'views': '400',
      'calls': '500',
      'directions': '300',
    },
  ];

  List<dynamic> _closed = [
    {
      'image': 'assets/images/narzo.png',
      'title': 'Realme Narzo 50A 128GBRedColor',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum leo quis pellentesque scelerisque.',
      'id': '#OFS238469',
    },
    {
      'image': 'assets/images/narzo.png',
      'title': 'Realme Narzo 50A 128GBRedColor',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum leo quis pellentesque scelerisque.',
      'id': '#OFS238470',
    },
    {
      'image': 'assets/images/narzo.png',
      'title': 'Realme Narzo 50A 128GBRedColor',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum leo quis pellentesque scelerisque.',
      'id': '#OFS238471',
    },
    {
      'image': 'assets/images/narzo.png',
      'title': 'Realme Narzo 50A 128GBRedColor',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum leo quis pellentesque scelerisque.',
      'id': '#OFS238472',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Widget> _pagesList = [
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 10,left: 10,right: 10),
          child: ListView.builder(
              itemCount: _active.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      // height: 130,
                      width: width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0XFFFFFFFF),
                                Color(0XFFECECEC),
                              ]),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.3),
                                spreadRadius: 2.0,
                                blurRadius: 4.0,
                                offset: Offset(0.0, 3.0))
                          ],
                          border: Border.all(
                              color: Color(0XFFDCDCDC)),
                          borderRadius:
                          BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius
                                            .circular(7)),
                                    child: Image.asset(
                                      _active[index]['image'],
                                      fit: BoxFit.fill,
                                      height: 130,
                                    ))),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _active[index]['title'],
                                      style: TextStyle(
                                        fontWeight:
                                        FontWeight.bold,
                                        fontSize: 14,
                                        color:
                                        Color(0XFF484848),
                                      ),
                                      overflow:
                                      TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      _active[index]
                                      ['description'],
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.w500,
                                          fontSize: 8,
                                          color:
                                          Color(0XFF848484),
                                          height: 1.4),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5,top: 20,left: 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0XFFe0e0e0),
                                                spreadRadius: 2.0,
                                                blurRadius: 4.0,
                                                offset: Offset(0.0, 0.0))
                                          ],                                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(

                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {},
                                                        child:
                                                        ImageIcon(
                                                          AssetImage(
                                                              'assets/images/ant-design_like-filled.png'),
                                                          size: 25,
                                                          color: Color(
                                                              0XFF05A33B),
                                                        )),
                                                    Text(
                                                      _active[index]
                                                      ['like'],
                                                      style: TextStyle(
                                                          color: Color(
                                                              0XFF353535),
                                                          fontSize: 8,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Spacer(),

                                              Container(

                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {},
                                                        child:
                                                        ImageIcon(
                                                          AssetImage(
                                                              'assets/images/ant-design_like-filled (1).png'),
                                                          size: 25,
                                                          color: Color(
                                                              0XFFC00606),
                                                        )),
                                                    Text(
                                                      _active[index]
                                                      ['disLike'],
                                                      style: TextStyle(
                                                          color: Color(
                                                              0XFF353535),
                                                          fontSize: 8,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: ImageIcon(
                                                        AssetImage(
                                                            'assets/images/chat.png'),
                                                      )
                                                    ),
                                                    Text(
                                                      _active[index]
                                                      ['messages'],
                                                      style: TextStyle(
                                                          color: Color(
                                                              0XFF353535),
                                                          fontSize: 8,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Icon(
                                                        Icons
                                                            .remove_red_eye_outlined,
                                                        color: Color(
                                                            0XFFC00606),
                                                        size: 25,
                                                      ),
                                                    ),
                                                    Text(
                                                      _active[index]
                                                      ['views'],
                                                      style: TextStyle(
                                                          color: Color(
                                                              0XFF353535),
                                                          fontSize: 8,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Spacer(),

                                              Container(
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left: 2,
                                                      right: 2,
                                                      top: 2),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    children: [
                                                      GestureDetector(
                                                        child:
                                                        Container(
                                                          height: 21,
                                                          width: 20,
                                                          decoration:
                                                          BoxDecoration(
                                                              gradient:
                                                              LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                                                Color(0XFF03DCFA),
                                                                Color(0XFF07458E),
                                                              ]),
                                                              borderRadius: BorderRadius.circular(60)),
                                                          child:
                                                          Center(
                                                            child: Image
                                                                .asset(
                                                              'assets/images/Group.png',
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () {},
                                                      ),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text(
                                                        _active[index]
                                                        ['calls'],
                                                        style: TextStyle(
                                                            color: Color(
                                                                0XFF353535),
                                                            fontSize:
                                                            8,
                                                            fontWeight:
                                                            FontWeight
                                                                .w500),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left: 2,
                                                      right: 2,
                                                      top: 2),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    children: [
                                                      GestureDetector(
                                                        child:
                                                        Container(
                                                          height: 21,
                                                          width: 20,
                                                          decoration:
                                                          BoxDecoration(
                                                              gradient:
                                                              LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                                                Color(0XFF059324),
                                                                Color(0XFF056119),
                                                              ]),
                                                              borderRadius: BorderRadius.circular(60)),
                                                          child:
                                                          Center(
                                                            child: Image
                                                                .asset(
                                                              'assets/images/fluent_call-24-filled.png',
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () {},
                                                      ),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text(
                                                        _active[index]
                                                        [
                                                        'directions'],
                                                        style: TextStyle(
                                                            color: Color(
                                                                0XFF353535),
                                                            fontSize:
                                                            8,
                                                            fontWeight:
                                                            FontWeight
                                                                .w500),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20)
                  ],
                );
              }),
        ),
      ),
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 10,left: 10,right: 10),
          child: ListView.builder(
              itemCount: _closed.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      // height: 130,
                      width: width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0XFFFFFFFF),
                                Color(0XFFECECEC),
                              ]),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.3),
                                spreadRadius: 2.0,
                                blurRadius: 4.0,
                                offset: Offset(0.0, 3.0))
                          ],
                          border: Border.all(
                              color: Color(0XFFDCDCDC)),
                          borderRadius:
                          BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius
                                            .circular(7)),
                                    child: Image.asset(
                                      _closed[index]['image'],height: 130,
                                      fit: BoxFit.fill,
                                    ))),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _closed[index]['title'],
                                      style: TextStyle(
                                        fontWeight:
                                        FontWeight.bold,
                                        fontSize: 14,
                                        color:
                                        Color(0XFF484848),
                                      ),
                                      overflow:
                                      TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      _closed[index]
                                      ['description'],
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.w500,
                                          fontSize: 8,
                                          color:
                                          Color(0XFF848484),
                                          height: 1.4),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width: 130,
                                        height: 30,
                                        decoration:
                                        BoxDecoration(
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                17.5),
                                            gradient: LinearGradient(
                                                begin: Alignment
                                                    .topCenter,
                                                end: Alignment
                                                    .bottomCenter,
                                                colors: [
                                                  Color(
                                                      0XFFDB5408),
                                                  Color(
                                                      0XFFEF1001),
                                                ])),
                                        child: Center(
                                          child: Text(
                                            "Reopen Campaign",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(
                                                    0XFFFFFFFF),
                                                fontWeight:
                                                FontWeight
                                                    .w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20)
                  ],
                );
              }),
        ),
      ),
    ];
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
                      top: 200, right: 10, left: 10,),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Container(
                      // width: width-40,
                      // height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          _menuBar(context),
                          SizedBox(height: 20,),
                          Expanded(
                            // flex: 2,
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: _pagesList.length ,
                              // physics: const ClampingScrollPhysics(),
                              onPageChanged: onChangedFunction,
                              itemBuilder: (BuildContext context, int index) {
                                return FractionallySizedBox(
                                  widthFactor: 1 / _pageController.viewportFraction,
                                  child: Container(
                                    child: _pagesList[index],
                                  ),
                                );
                              },
                              // children: <Widget>[
                              //
                              // ],
                            ),
                          ),
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
                          activePageIndex == 0
                              ? "Campaigns Statistics"
                              : "Closed Campaigns",
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
  Widget _menuBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40.0,
        decoration:  BoxDecoration(
          image: activePageIndex == 0 ?
          DecorationImage(image: AssetImage('assets/images/Rectangle 93.png'),fit: BoxFit.fill):
          DecorationImage(image: AssetImage('assets/images/Rectangle 92.png'),fit: BoxFit.fill),

          // gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       Color(0XFFE2E2E2),
          //       Color(0XFFC7C7C7)
          //     ]),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: _onActiveCampaignsButttonPress,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: (activePageIndex == 0) ? const BoxDecoration(
                    // image: DecorationImage(image: AssetImage('assets/images/Rectangle 90.png'),fit: BoxFit.fill),
                    // gradient: LinearGradient(
                    //               begin: Alignment.topCenter,
                    //               end: Alignment.bottomCenter,
                    //               colors: [
                    //                 Color(0XFFF10C01),
                    //                 Color(0XFFE13A06)
                    //                 ]),
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    ),
                  ) : null,
                  child:
                  Text(
                    "Active Campaigns",
                    style: (activePageIndex == 0) ? TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 14) : TextStyle(color: Color(0XFF333333),fontWeight: FontWeight.w600,fontSize: 14),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: _onClosedCampaignsButttonPress,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: (activePageIndex == 1) ? const BoxDecoration(
                    // image: DecorationImage(image: AssetImage('assets/images/Rectangle 91.png'),fit: BoxFit.fill),
                    // gradient: LinearGradient(
                    //     begin: Alignment.topCenter,
                    //     end: Alignment.bottomCenter,
                    //     colors: [
                    //       Color(0XFFF10C01),
                    //       Color(0XFFE13A06)
                    //     ]),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ) : null,
                  child: Text(
                    "Closed Campaigns",
                    style: (activePageIndex == 1) ? TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 14) : TextStyle(color: Color(0XFF333333),fontWeight: FontWeight.w600,fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _onActiveCampaignsButttonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
  }

  void _onClosedCampaignsButttonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
  }
}
