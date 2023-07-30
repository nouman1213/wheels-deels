import 'package:flutter/material.dart';

import '../constants/images.dart';

class FeaturedCardWidget extends StatelessWidget {
  String title;
  String price;
  String specfi;
  String city;
  String image;
  VoidCallback ontap;

  FeaturedCardWidget(
      {Key? key,
      required this.title,
      required this.price,
      required this.specfi,
      required this.city,
      required this.image,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Container(
                          child: Image.asset(
                            image,
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 80,
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.only(left: 5, top: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_outlined, size: 12),
                              Text(
                                "$city",
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 40),
                        Container(
                            alignment: Alignment.centerRight,
                            // margin: EdgeInsets.only(right: 8, top: 5),
                            child: Image.asset(featuredLogo)),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("$title"),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "$price",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "$specfi",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
