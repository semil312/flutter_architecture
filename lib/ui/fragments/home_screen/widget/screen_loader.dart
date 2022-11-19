import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/color_config.dart';
import 'package:shimmer/shimmer.dart';

class ScreenLoader extends StatelessWidget {
  const ScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ShimmerWrapper(
                  child: Container(
                    height: 150,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Row(
                    children: [
                      ShimmerWrapper(
                        child: Container(
                          height: 20,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    ShimmerWrapper(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 40,
                          width: 67,
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ),
                    ShimmerWrapper(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: 40,
                        width: 67,
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    )),
                    ShimmerWrapper(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 40,
                          width: 67,
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 240,
                            crossAxisCount: 2,
                            mainAxisSpacing: 18,
                            crossAxisSpacing: 13),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return ShimmerWrapper(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerWrapper extends StatelessWidget {
  Widget child;

  ShimmerWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[100]!,
      child: child,
    );
  }
}