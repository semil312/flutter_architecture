// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/color_config.dart';
import 'package:flutter_architecture/ui/fragments/home_screen/home_screen_view_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatelessWidget {
  HomeScreenViewModel model;

  ImageSlider({super.key, required this.model});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 170,
          child: PageView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset('icons/banner.png', fit: BoxFit.cover,)),
              );
            },
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 140),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: SwapEffect(
                  dotHeight:  7,
                  dotWidth: 7,
                  dotColor: ColorConfig.primaryColor,
                  activeDotColor: ColorConfig.greyColor,
                  spacing: 5),
            ),
          ),
        )
      ],
    );
  }
}
