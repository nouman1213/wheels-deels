import 'package:flutter/material.dart';
import 'package:wheelsndeels/UI/constants/app_textStyle.dart';

class BrandWidget extends StatelessWidget {
  final String title;
  final String image;
  const BrandWidget({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Image.asset(
                      image.toString(),
                      height: 20,
                      width: 40,
                    ),
                    SizedBox(height: 5),
                    Text(
                      title.toString(),
                      style: AppTextStyle.headline2Black(context)
                          .copyWith(fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
