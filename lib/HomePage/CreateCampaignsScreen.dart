import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as storageRef;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:images_picker/images_picker.dart';
import 'package:offers_52/widgets/custom_displays.dart';

import '../services/shared_preference.dart';
import 'BuyCampaignScreen.dart';

class CreateCampaignsScreen extends StatefulWidget {
  const CreateCampaignsScreen({
    Key? key,
    required this.route,
  }) : super(key: key);
  final String route;

  @override
  _CreateCampaignsScreenState createState() => _CreateCampaignsScreenState();
}

class _CreateCampaignsScreenState extends State<CreateCampaignsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController usualController = TextEditingController();
  TextEditingController reducedController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final SharedPreference _sharedPreference = SharedPreference();
  final CarouselController _controller = CarouselController();
  late bool visible;
  var dropdownSelectedItem;
  List? path = [];
  String uniqueIdName = DateTime.now().millisecondsSinceEpoch.toString();
  String? sellerId = "";
  String? sellerName = "";
  String? shopNumber = "";
  List<String> downloadUrlList = [];

  @override
  void initState() {
    if (widget.route == "homeScreen") {
      setState(() {
        visible = true;
      });
    } else {
      setState(() {
        visible = false;
      });
    }
    super.initState();
  }

  postOffer() async {
    sellerId = await _sharedPreference.get("uid");
    sellerName = await _sharedPreference.get("name");
    shopNumber = await _sharedPreference.get("phone");
    if (titleController.text.isEmpty &&
        descController.text.isEmpty &&
        usualController.text.isEmpty &&
        reducedController.text.isEmpty) {
      CustomDisplays.showToast(msg: "Please fill all the fields", context: context);
    } else if (path!.length != 3) {
      CustomDisplays.showToast(msg: "Please choose at least 3 images", context: context);
    } else {
      CustomDisplays.showProgress(context);
      for (var i = 0; i < path!.length; i++) {
        if (path![i] != "") {
          String downloadUrl = await uploadImage(File(path![i]));
          downloadUrlList.add(downloadUrl);
        }
      }

      saveInfo(downloadUrlList);
    }
  }

  uploadImage(mImageFile) async {
    uniqueIdName = DateTime.now().millisecondsSinceEpoch.toString();
    storageRef.Reference reference = storageRef.FirebaseStorage.instance.ref().child("campaigns");
    storageRef.UploadTask uploadTask = reference.child(uniqueIdName + ".jpg").putFile(mImageFile);
    storageRef.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
    String downloadingUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadingUrl;
  }

//saving menu information to firebase
  saveInfo(List<String> downloadUrl) {
    final ref = FirebaseFirestore.instance
        //under sellers collection
        .collection("sellers")
        //for every unique seller
        .doc(sellerId)
        .collection("campaigns");

//information pass to firebase
    ref.doc(uniqueIdName).set(
      {
        "campID": uniqueIdName,
        "sellerUID": sellerId,
        "sellerName": sellerName,
        "shortInfo": shopNumber,
        "categories": dropdownSelectedItem,
        "longDescription": descController.text,
        "usualPrice": usualController.text,
        "reducedPrice": reducedController.text,
        "title": titleController.text.toString(),
        "publishedDate": DateTime.now(),
        "status": "available",
        "thumbnailUrl1": downloadUrl[0].toString(),
        "thumbnailUrl2": downloadUrl[1].toString(),
        "thumbnailUrl3": downloadUrl[2].toString(),
      },
    ).then((value) {
      final ref1 = FirebaseFirestore.instance.collection("campaigns");
      ref1.doc(uniqueIdName).set(
        {
          "campID": uniqueIdName,
          "sellerUID": sellerId,
          "sellerName": sellerName,
          "shortInfo": shopNumber,
          "categories": dropdownSelectedItem,
          "longDescription": descController.text,
          "usualPrice": usualController.text,
          "reducedPrice": reducedController.text,
          "title": titleController.text.toString(),
          "publishedDate": DateTime.now(),
          "status": "available",
          "thumbnailUrl1": downloadUrl[0].toString(),
          "thumbnailUrl2": downloadUrl[1].toString(),
          "thumbnailUrl3": downloadUrl[2].toString(),
        },
      ).then((value) {
        CustomDisplays.closeDialog(context);
        CustomDisplays.showToast(msg: "Campaigns details uploaded successfully", context: context);
        titleController.text = "";
        descController.text = "";
        usualController.text = "";
        reducedController.text = "";
        path?.clear();
        downloadUrlList.clear();
        setState(
          () {
            uniqueIdName = DateTime.now().millisecondsSinceEpoch.toString();
          },
        );
      });
    });
  }

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
                  padding: EdgeInsets.only(top: 200, right: 20, left: 20, bottom: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                            visible: visible == true,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
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
                                                  constraints: BoxConstraints(maxWidth: 200),
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
                                                          color: Colors.black.withOpacity(0.25),
                                                          spreadRadius: 0.0,
                                                          blurRadius: 14.0,
                                                          offset: Offset(0.0, 4.0))
                                                    ],
                                                    gradient: LinearGradient(
                                                        begin: Alignment.topCenter,
                                                        end: Alignment.bottomCenter,
                                                        colors: [
                                                          Color(0XFFFFFFFF),
                                                          Color(0XFFF3F3F3),
                                                        ]),
                                                    borderRadius: BorderRadius.circular(60)),
                                                child: Center(
                                                  child: Text(
                                                    "10",
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        fontWeight: FontWeight.w600,
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
                                                      builder: (contexts) => BuyCampaignScreen(),
                                                    ),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0XFFEBEBEB),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(17.5)),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Buy Campaign",
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
                                                  setState(() {
                                                    visible = false;
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0XFFEBEBEB),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(17.5)),
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
                                                constraints: BoxConstraints(maxWidth: 200),
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
                                                  gradient: LinearGradient(
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                      colors: [
                                                        Color(0XFFFFFFFF),
                                                        Color(0XFFF3F3F3),
                                                      ]),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black.withOpacity(0.25),
                                                        spreadRadius: 0.0,
                                                        blurRadius: 14.0,
                                                        offset: Offset(0.0, 4.0))
                                                  ],
                                                  borderRadius: BorderRadius.circular(60)),
                                              child: Center(
                                                child: Text(
                                                  "06",
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight: FontWeight.w600,
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
                              ],
                            )),
                        Visibility(
                          visible: visible == false,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0XFFEFEFEF),
                                      border: Border.all(color: Color(0XFFE3E1E1)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10, right: 5),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          hint: Text(
                                            "Select Categories",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0XFF706E6E)),
                                          ),
                                          items: <String>[
                                            'Electronics',
                                            'Furniture',
                                            'Groceries',
                                            'Restaurant & cafes',
                                            'Clothing',
                                            'Real estate',
                                            'Automobile',
                                            'Health',
                                            'Beauty',
                                            'Travel',
                                            'Pets',
                                            'Books & Stationaries',
                                            'Jewellery',
                                            'Kids',
                                            'Home appliances',
                                            'Sports',
                                            'Consultants',
                                            'Footwear'
                                          ].map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          value: dropdownSelectedItem,
                                          onChanged: (val) {
                                            dropdownSelectedItem = val;
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Offer Pictures (Upload max 3 images)",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0XFF706E6E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    List<Media>? res = await ImagesPicker.pick(
                                      count: 3,
                                      pickType: PickType.image,
                                      language: Language.System,
                                      // maxSize: 500,
                                      // cropOpt: CropOption(
                                      //   aspectRatio: CropAspectRatio.wh16x9,
                                      // ),
                                    );
                                    print(res);
                                    if (res != null) {
                                      print(res.map((e) => e.path).toList());
                                      setState(() {
                                        path = res.map((e) => e.path).toList();
                                        print("path : $path");
                                      });
                                      // bool status = await ImagesPicker.saveImageToAlbum(File(res[0]?.path));
                                      // print(status);
                                    }
                                  },
                                  child: Container(
                                    height: 160,
                                    width: width,
                                    decoration: BoxDecoration(
                                        color: Color(0XFFEFEFEF),
                                        borderRadius: BorderRadius.circular(20)),
                                    child: path!.isEmpty == true
                                        ? Center(
                                            child: Container(
                                              height: 90,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(60)),
                                              child: Center(
                                                child: Image.asset("assets/images/upload 2.png"),
                                              ),
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.only(left: 6, right: 6),
                                            child: CarouselSlider(
                                              options: CarouselOptions(
                                                  enableInfiniteScroll: false,
                                                  viewportFraction: 1,
                                                  initialPage: 0,
                                                  autoPlay: false,
                                                  onPageChanged: (index, reason) {
                                                    // setState(() {
                                                    //   _currentIndex = index;
                                                    // });
                                                  }),
                                              carouselController: _controller,
                                              items: path!
                                                  .map((item) => Container(
                                                        child: Image.file(
                                                          File(item),
                                                          // width: MediaQuery.of(context).size.width,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ))
                                                  .toList(),
                                            ),
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Title",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0XFF706E6E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 40,
                                  child: TextFormField(
                                    controller: titleController,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(color: Color(0XFFE3E1E1)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide(color: Color(0XFFE3E1E1)),
                                        ),
                                        fillColor: Color(0XFFEEEEEE),
                                        filled: true,
                                        contentPadding: const EdgeInsets.only(left: 10.0),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(40.0))),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Description",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0XFF706E6E)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    TextFormField(
                                      maxLines: 4,
                                      controller: descController,
                                      maxLength: 140,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                            borderSide: BorderSide(color: Color(0XFFE3E1E1)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                            borderSide: BorderSide(color: Color(0XFFE3E1E1)),
                                          ),
                                          fillColor: Color(0XFFEEEEEE),
                                          filled: true,
                                          contentPadding: const EdgeInsets.only(left: 10, top: 10),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(40.0))),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Usual Price",
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Color(0XFF706E6E)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 40,
                                          width: width / 2.4,
                                          child: TextFormField(
                                            controller: usualController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(color: Color(0XFFE3E1E1)),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(color: Color(0XFFE3E1E1)),
                                                ),
                                                fillColor: Color(0XFFEEEEEE),
                                                filled: true,
                                                prefixIcon: ImageIcon(
                                                  AssetImage('assets/images/dolllar.png'),
                                                  color: Color(0XFF8E8E8E),
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(vertical: 0.0),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(40.0))),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Reduced Price",
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Color(0XFF706E6E)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 40,
                                          width: width / 2.4,
                                          child: TextFormField(
                                            controller: reducedController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(color: Color(0XFFE3E1E1)),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  borderSide: BorderSide(color: Color(0XFFE3E1E1)),
                                                ),
                                                fillColor: Color(0XFFEEEEEE),
                                                filled: true,
                                                prefixIcon: ImageIcon(
                                                  AssetImage('assets/images/dolllar.png'),
                                                  color: Color(0XFF8E8E8E),
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(vertical: 10.0),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(40.0))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      postOffer();
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Color(0XFFDC3232),
                                        borderRadius: BorderRadius.circular(25)),
                                    child: Center(
                                      child: Text(
                                        "POST OFFER",
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
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
                          "Create Campaigns",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 26, color: Colors.white),
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
