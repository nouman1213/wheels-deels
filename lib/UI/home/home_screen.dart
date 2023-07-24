import 'package:flutter/material.dart';
import 'package:wheelsndeels/UI/components/home_top_row.dart';
import 'package:wheelsndeels/UI/components/keybord_hider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTopRowItemIndex = 0;

  final List<String> topRowItems = [
    "Used Car",
    "New Car",
    "Bike",
    "Auto Store"
  ];

  final List<String> _items = [
    'Islamabad',
    'Lahore',
    'Karachi',
    'Peshawer',
    'Faisalabad',
  ];

  String selectedValue = 'Islamabad';
  @override
  Widget build(BuildContext context) {
    return KeyboardHider(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          SizedBox(height: 25),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Icon(Icons.home),
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
                  SizedBox(height: 10),
                  searchCardWidget(),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
          ))
        ]),
      ),
    );
  }

  Card searchCardWidget() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 28,
                    ),
                    hintText: 'Search used car',
                    border: InputBorder.none),
              ),
            ),
            Text(
              "|",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.location_on_outlined,
              size: 28,
            ),
            SizedBox(width: 10),
            DropdownButton<String>(
              underline: Container(),
              elevation: 0,
              icon: Icon(Icons.keyboard_arrow_down),
              value: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
              items: _items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
