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
        body: Center(
          child: Text('Your Car List Content Goes Here'),
        ),
      ),
    );
  }
}
