import 'package:flutter/material.dart';

import 'package:wheelsndeels/UI/constants/app_textStyle.dart';

import '../components/featuredCardWidget.dart';
import '../constants/globals_variables.dart';
import '../constants/images.dart';

// ignore: must_be_immutable
class CarListScreen extends StatelessWidget {
  String? appBarTitle;
  CarListScreen({
    Key? key,
    this.appBarTitle,
  }) : super(key: key);
  List listCarRow = ["Price", "Location", "Model", "Year"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(appBarTitle ?? 'Default Title'),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 65,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listCarRow.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Center(
                            child: Text(
                          listCarRow[index],
                          style: AppTextStyle.bodyText2Black(context).copyWith(
                              fontWeight: FontWeight.bold, letterSpacing: 1),
                        )),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return FeaturedCardWidget(
                      city: '$dropDownSelectedValue',
                      image: '$car1',
                      price: 'PKR 40.3 lacs',
                      specfi: '2017  |  33.9 km  |  Petrol',
                      title: 'Toyota corolla 2021',
                      ontap: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (_) =>
                        //               CarListScreen(appBarTitle: featuredCar)));
                      },
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
