import 'package:flutter/material.dart';
import 'package:wheelsndeels/UI/components/home_top_row.dart';
import 'package:wheelsndeels/UI/components/keybord_hider.dart';
import 'package:wheelsndeels/UI/constants/app_textStyle.dart';

import '../components/brand_widget.dart';
import '../constants/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _selectedTopRowItemIndex = 0;

  String selectedValue = 'Islamabad';
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardHider(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
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
                    Card(
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
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
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
                              items: items.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Feature used cars",
                        style: AppTextStyle.headline2Black(context),
                      ),
                      SizedBox(width: 10),
                      TabBar(
                        controller: tabController,
                        labelColor: Colors.black,
                        labelStyle: AppTextStyle.headline2Black(context)
                            .copyWith(fontSize: 16),
                        tabs: [
                          Tab(text: 'Brand'),
                          Tab(text: 'Model'),
                          Tab(text: 'City'),
                          Tab(text: 'Year'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            BranView(),
                            BranView(),
                            BranView(),
                            BranView(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BranView extends StatelessWidget {
  const BranView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 182,
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 0.0,
                    // mainAxisSpacing: 0.0,
                  ),
                  itemCount: brandList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BrandWidget(
                        image: imgList[index], title: brandList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
