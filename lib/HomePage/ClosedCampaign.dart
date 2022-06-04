import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ClosedCampaign extends StatefulWidget {
  const ClosedCampaign({Key? key}) : super(key: key);

  @override
  _ClosedCampaignState createState() => _ClosedCampaignState();
}

class _ClosedCampaignState extends State<ClosedCampaign> {
  List<dynamic> _closedList = [
    {
      'image':
          'assets/images/in-galaxy-z-fold3-f926-5g-sm-f926bzgdinu-474118690 1.png',
      'title': 'SAMSUNG Galaxy Z Fold3 5G',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum leo quis pellentesque scelerisque.',
      'reducedPrice': '₹1,57,999',
      'actualPrice': '₹1,79,999',
      'likes': '101',
      'dislikes': '20',
    },
    {
      'image':
          'assets/images/in-galaxy-z-fold3-f926-5g-sm-f926bzgdinu-474118690 1.png',
      'title': 'SAMSUNG Galaxy Z Fold3 5G',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum leo quis pellentesque scelerisque.',
      'reducedPrice': '₹1,57,999',
      'actualPrice': '₹1,79,999',
      'likes': '101',
      'dislikes': '20',
    },
    {
      'image':
          'assets/images/in-galaxy-z-fold3-f926-5g-sm-f926bzgdinu-474118690 1.png',
      'title': 'SAMSUNG Galaxy Z Fold3 5G',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum leo quis pellentesque scelerisque.',
      'reducedPrice': '₹1,57,999',
      'actualPrice': '₹1,79,999',
      'likes': '101',
      'dislikes': '20',
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
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: 200, right: 20, left: 20, bottom: 20),
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0XFFFFFFF),
                                border: Border.all(
                                    color: Color(0XFF979797), width: 0.5),
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: TextFormField(
                                enabled: true,
                                style: TextStyle(fontSize: 10),
                                decoration: InputDecoration(
                                  hintText: 'Find Mobile Phones and more...',
                                  contentPadding: EdgeInsets.only(top: 8),
                                  hintStyle: TextStyle(
                                      color: Color(0XFF979797), fontSize: 10),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 20,
                                    color: Color(0xFFACACAC),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: ListView.builder(
                                itemCount: _closedList.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                          onTap: () {},
                                          child: Card(
                                            elevation: 5,
                                            shadowColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Color(0XFFFFFFFF),
                                                        Color(0XFFECECEC),
                                                      ])),
                                              child: Padding(
                                                padding: EdgeInsets.all(20),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: Image.asset(
                                                            _closedList[index]
                                                                ['image'])),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                  constraints:
                                                                      BoxConstraints(
                                                                          maxWidth:
                                                                              150),
                                                                  child: Text(
                                                                    _closedList[
                                                                            index]
                                                                        [
                                                                        'title'],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Color(
                                                                            0XFF353535)),
                                                                  )),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                _closedList[
                                                                        index][
                                                                    'description'],
                                                                style: TextStyle(
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color(
                                                                        0XFF848484)),
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    _closedList[
                                                                            index]
                                                                        [
                                                                        'reducedPrice'],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Color(
                                                                            0XFFCC1A0A)),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Text(
                                                                    _closedList[
                                                                            index]
                                                                        [
                                                                        'actualPrice'],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        color: Color(
                                                                            0XFF828282),
                                                                        decoration:
                                                                            TextDecoration.lineThrough),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      GestureDetector(
                                                                          onTap:
                                                                              () {},
                                                                          child:
                                                                              ImageIcon(
                                                                            AssetImage('assets/images/ant-design_like-filled.png'),
                                                                            size:
                                                                                25,
                                                                            color:
                                                                                Color(0XFF05A33B),
                                                                          )),
                                                                      Text(
                                                                        _closedList[index]
                                                                            [
                                                                            'likes'],
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0XFF353535),
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      GestureDetector(
                                                                          onTap:
                                                                              () {},
                                                                          child:
                                                                              ImageIcon(
                                                                            AssetImage('assets/images/ant-design_like-filled (1).png'),
                                                                            size:
                                                                                25,
                                                                            color:
                                                                                Color(0XFFC00606),
                                                                          )),
                                                                      Text(
                                                                        _closedList[index]
                                                                            [
                                                                            'dislikes'],
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0XFF353535),
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Spacer(),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (_) {
                                                                            return popup();
                                                                          });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          35,
                                                                      width: 35,
                                                                      decoration: BoxDecoration(
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                                color: Colors.green.withOpacity(0.4),
                                                                                offset: Offset(0.0, 2),
                                                                                spreadRadius: 1.0,
                                                                                blurRadius: 2.0)
                                                                          ],
                                                                          color: Color(
                                                                              0XFFFFFFFF),
                                                                          borderRadius:
                                                                              BorderRadius.circular(60)
                                                                          // image: DecorationImage(image: AssetImage(''))
                                                                          ),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .remove_red_eye_outlined,
                                                                          color:
                                                                              Color(0XFFC00606),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  );
                                }),
                          ),
                        ],
                      )),
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
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            "Closed Campaign",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 28,
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
      ),
    );
  }
}

class popup extends StatefulWidget {
  const popup({Key? key}) : super(key: key);

  @override
  _popupState createState() => _popupState();
}

class _popupState extends State<popup> {
  final CarouselController _controller = CarouselController();

  int _currentIndex = 0;
  final List<String> imagesList = [
    'assets/images/in-galaxy-z-fold3-f926-5g-sm-f926bzgdinu-474118690 1.png',
    'assets/images/in-galaxy-z-fold3-f926-5g-sm-f926bzgdinu-474118690 1.png',
    'assets/images/in-galaxy-z-fold3-f926-5g-sm-f926bzgdinu-474118690 1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Container(
        height: MediaQuery.of(context).size.height <= 720
            ? MediaQuery.of(context).size.height / 1.50
            : MediaQuery.of(context).size.height / 1.65,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0XFFFFFFFF),
                  Color(0XFFECECEC),
                ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(60),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0XFFDC4F07),
                                Color(0XFFED1601),
                              ]),
                          borderRadius: BorderRadius.circular(60)),
                      height: 20,
                      width: 20,
                      child: Center(
                        child: Icon(
                          Icons.close,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3.2,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(children: [
                      CarouselSlider(
                        options: CarouselOptions(
                            enableInfiniteScroll: false,
                            height: MediaQuery.of(context).size.height / 3.2,
                            viewportFraction: 1,
                            autoPlay: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            }),
                        carouselController: _controller,
                        items: imagesList
                            .map((item) => Image.asset(
                                  item,
                                  height:
                                      MediaQuery.of(context).size.height / 3.2,
                                  fit: BoxFit.fill,
                                ))
                            .toList(),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                            onTap: () {
                              _controller.previousPage();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.black,
                            )),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () {
                              _controller.nextPage();
                            },
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.black,
                            )),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: imagesList.length,
                        itemBuilder: (context, i) {
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == i
                                  ? Color(0XFFCC1A0A)
                                  : Color(0XFFB2B2B2),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SAMSUNG Galaxy Z Fold3 5G',
                    style: TextStyle(
                        color: Color(0XFF353535),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum leo quis pellentesque scelerisque. Fusce gravida pharetra arcu, eu dignissim nisi consectetur eget. Curabitur vulputate fermentum faucibus.',
                    style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF848484)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        '1,57,999',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0XFFCC1A0A)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '1,79,999',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Color(0XFFCC1A0A),
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                                onTap: () {},
                                child: ImageIcon(
                                  AssetImage(
                                      'assets/images/ant-design_like-filled.png'),
                                  size: 25,
                                  color: Color(0XFF05A33B),
                                )),
                            Text(
                              '101',
                              style: TextStyle(
                                  color: Color(0XFF353535),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                                onTap: () {},
                                child: ImageIcon(
                                  AssetImage(
                                      'assets/images/ant-design_like-filled (1).png'),
                                  size: 25,
                                  color: Color(0XFFC00606),
                                )),
                            Text(
                              '20',
                              style: TextStyle(
                                  color: Color(0XFF353535),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Spacer(),
                        Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(17.5),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.5),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0XFFDB5408),
                                        Color(0XFFEF1001)
                                      ])),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Reopen Campaign",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
