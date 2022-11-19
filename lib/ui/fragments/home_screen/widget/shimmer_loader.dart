// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.builder(
        key: PageStorageKey('shimmer'),
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 240),
        itemBuilder: (context, index) {
          return ShimmerWrapper(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black54,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Stack(
                        children: [
                          ShimmerWrapper(
                            child: Center(
                              child: SizedBox(
                                height: 140,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: ShimmerWrapper(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black54,
                                ),
                                height: 12,
                                width: 45,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 5),
                      child: ShimmerWrapper(
                        child: Container(
                          color: Colors.black54,
                          height: 10,
                          width: 80,
                          padding: const EdgeInsets.only(bottom: 5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ShimmerWrapper(
                        child: Container(
                          color: Colors.black54,
                          height: 10,
                          width: 60,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7, left: 8.0),
                      child: ShimmerWrapper(
                        child: Container(
                          color: Colors.red,
                          height: 10,
                          width: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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
