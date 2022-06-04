import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'Carousel.dart';

class LiveCampaignScreen extends StatefulWidget {
  const LiveCampaignScreen({Key? key}) : super(key: key);

  @override
  _LiveCampaignScreenState createState() => _LiveCampaignScreenState();
}

class _LiveCampaignScreenState extends State<LiveCampaignScreen> {
  CarouselController _carouselController = CarouselController();
  int _current = 0;

  List<dynamic> _movies = [
    {
      'title': 'Aliquam convallis',
      'image': 'assets/images/9.png',
      'description':
          'Libero ligula, vel vehicula lectus mattis nec. Sed aliquam lectus condimentum convallis hendrerit.',
      'usualPrice': '\$ 25.000',
      'reducedPrice': '\$ 23.000',
    },
    {
      'title': 'Aliquam convallis',
      'image': 'assets/images/9.png',
      'description':
          'Libero ligula, vel vehicula lectus mattis nec. Sed aliquam lectus condimentum convallis hendrerit.',
      'usualPrice': '\$ 25.000',
      'reducedPrice': '\$ 23.000',
    },
    {
      'title': 'Aliquam convallis',
      'image': 'assets/images/9.png',
      'description':
          'Libero ligula, vel vehicula lectus mattis nec. Sed aliquam lectus condimentum convallis hendrerit.',
      'usualPrice': '\$ 25.000',
      'reducedPrice': '\$ 23.000',
    }
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Image.asset(_movies[_current]['image'],
                  height: height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        Colors.white.withOpacity(1),
                        Colors.white.withOpacity(0.6),
                        Colors.white.withOpacity(0.4),
                        Colors.white.withOpacity(0.1),
                        Colors.white.withOpacity(0.0),
                        Colors.white.withOpacity(0.0),
                        Colors.white.withOpacity(0.0),
                        Colors.white.withOpacity(0.0),
                      ])),
                ),
              ),
              Positioned(
                top: 160,
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: height / 1.5,
                    enlargeCenterPage: true,
                    aspectRatio: 0,
                    viewportFraction: 0.70,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  items: _movies.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Carousel(),
                                    SizedBox(height: 15),
                                    Text(
                                      movie['title'],
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.left,
                                    ),
                                    // rating
                                    SizedBox(height: 5),
                                    Container(
                                      child: Text(
                                        movie['description'],
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            height: 1.3,
                                            color: Color(0XFF7D7D7D)),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    SizedBox(height: 20),

                                    AnimatedOpacity(
                                      duration: Duration(milliseconds: 500),
                                      opacity:
                                          _current == _movies.indexOf(movie)
                                              ? 1.0
                                              : 0.0,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  'Usual price',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0XFF909090)),
                                                ),
                                                Text(
                                                  movie['usualPrice'],
                                                  style: GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20,
                                                      color: Color(0XFF909090),
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              children: [
                                                Text(
                                                  'Reduced price',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0XFF363636)),
                                                ),
                                                Text(
                                                  movie['reducedPrice'],
                                                  style: GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20,
                                                      color: Color(0XFF363636)),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      },
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                  icon: Image.asset(
                    "assets/images/back.png",
                    height: 25,
                    width: 25,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                  top: 0,
                  left: 10,
                  right: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Live Campaign",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
