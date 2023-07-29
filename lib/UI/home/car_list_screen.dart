import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  String? appBarTitle;
  CarListScreen({Key? key, required this.appBarTitle}) : super(key: key);

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
                height: 120,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Chip(label: Text("price"));
                  },
                ),
              ),
              SizedBox(height: 10),
            ],
          )),
    );
  }
}
