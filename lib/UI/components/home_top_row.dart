import 'package:flutter/material.dart';
import 'package:wheelsndeels/UI/constants/app_textStyle.dart';

class HomeTopRowListItem extends StatelessWidget {
  final String name;
  bool isSelected;

  HomeTopRowListItem({required this.name, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: 20,
        // width: 80,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.black,
          border: Border.all(color: isSelected ? Colors.black : Colors.white),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Center(
            child: Text(
              name,
              style: isSelected
                  ? AppTextStyle.bodyText2Black(context)
                      .copyWith(fontWeight: FontWeight.w700)
                  : AppTextStyle.bodyText2White(context)
                      .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
