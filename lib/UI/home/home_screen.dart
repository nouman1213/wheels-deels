import 'package:flutter/material.dart';
import 'package:wheelsndeels/UI/components/home_top_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> topRowItems = [
    "Used Car",
    "New Car",
    "Bike",
    "Auto Store"
  ];

  int _selectedTopRowItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        SizedBox(height: 25),
        Container(
          height: 200,
          // color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topRowItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTopRowItemIndex = index;
                            });
                          },
                          child: HomeTopRowListItem(
                            name: topRowItems[index],
                            isSelected: _selectedTopRowItemIndex == index,
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        ))
      ]),
    );
  }
}
