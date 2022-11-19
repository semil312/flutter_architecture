import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/locator.dart';
import 'package:flutter_architecture/config/color_config.dart';
import 'package:flutter_architecture/model/pet_model.dart';
import 'package:flutter_architecture/ui/about_cat_screen/widget/pet_details.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AboutCatScreen extends StatelessWidget {
  AboutCatScreen({Key? key}) : super(key: key);

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {

    PetModel arguments = ModalRoute.of(context)?.settings.arguments as PetModel;

    log('Name :${arguments.name.toString()}');

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorConfig.primaryColor,
      body: SlidingUpPanel(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        minHeight: height * 0.65,
        maxHeight: height * 0.65,
        panelBuilder: (scrollController) =>
            slidingPanel(scrollController: scrollController),
        body: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: arguments.images.length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: arguments.images[index].downloadURL,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                  errorWidget: (context, url, error) {
                    return const Icon(
                      Icons.error,
                      color: Colors.redAccent,
                    );
                  },
                  placeholder: (context, url) {
                    return Image.asset(
                      "images/placeholder.png",
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    );
                  },
                );
              },
            ),
            Positioned(
              left: 30,
              top: 55,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorConfig.primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Icon(
                      Icons.arrow_back,
                      color: ColorConfig.greyColor,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.31,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: arguments.images.length,
                  effect: SwapEffect(
                    spacing: 5,
                    activeDotColor: ColorConfig.greyColor,
                    dotHeight: arguments.images.length == 1 ? 0 : 7,
                    dotWidth: arguments.images.length == 1 ? 0 : 7,
                    dotColor: ColorConfig.primaryColor,
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

Widget slidingPanel({
  required ScrollController scrollController,
}) =>
    const ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: PetDetails(),
    );
