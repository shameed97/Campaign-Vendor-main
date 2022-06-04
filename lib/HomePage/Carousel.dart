import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  CarouselController _controller =  CarouselController();
  late int _currentIndex =0;


  final List<String> imagesList = [
    'assets/images/9.png',
    'assets/images/9.png',
    'assets/images/9.png',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height <= 690 ? height/2.6 : (height <= 720 ? height/2.45 : height/2.4),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),

      child:
      Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  enableInfiniteScroll: false,
                  height:height <= 690 ? height/2.6 : (height <= 720 ? height/2.45 : height/2.4),
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
              carouselController: _controller,
              items: imagesList
                  .map((item) =>
                  Container(
                    child: Stack(
                      children: [
                        Image.asset(
                          item,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
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
                                    end: Alignment.center,
                                    colors: [
                                      Colors.white,
                                      Colors.white.withOpacity(1),
                                      Colors.white.withOpacity(0.9),
                                      Colors.white.withOpacity(0.7),
                                      Colors.white.withOpacity(0.5),
                                      Colors.white.withOpacity(0.2),
                                      Colors.white.withOpacity(0.1),
                                      Colors.white.withOpacity(0.0),
                                    ]
                                )
                            ),
                          ),),
                      ],
                    ),
                  ))
                  .toList(),
            ),
            Align(
              alignment: Alignment.center,
              child:
              Row(
                children: [
                  GestureDetector(
                      onTap: (){
                        _controller.previousPage();
                      },
                      child: Icon(Icons.arrow_back_ios_sharp,color: Colors.white,)),
                  Spacer(),
                  GestureDetector(
                      onTap: (){
                        _controller.nextPage();
                      },
                      child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,)),
                ],
              ),
            ),
            Positioned(
              bottom: 10,left: 10,right: 10,
              child:
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child:

                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.bottomCenter,
                      child:
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
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              );
                            }),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                  onTap: (){
                                  },
                                  child: ImageIcon(AssetImage('assets/images/ant-design_like-filled.png'),size: 25,color: Color(0XFF058F23),)),
                              Text("20",style: TextStyle(fontSize: 9,color: Color(0XFF545454),fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(width: 5,),
                          Column(
                            children: [
                              GestureDetector(
                                  onTap: (){

                                  },
                                  child: ImageIcon(AssetImage('assets/images/ant-design_like-filled (1).png'),size: 25,color: Color(0XFFF50303),)),
                              Text("1",style: TextStyle(fontSize: 9,color: Color(0XFF545454),fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            )

          ]

      ),

    );
  }
}
