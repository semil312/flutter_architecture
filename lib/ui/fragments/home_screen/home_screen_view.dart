// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/base/app_setup.locator.dart';
import 'package:flutter_architecture/config/color_config.dart';
import 'package:flutter_architecture/model/pet_model.dart';
import 'package:flutter_architecture/ui/fragments/home_screen/home_screen_view_model.dart';
import 'package:flutter_architecture/ui/fragments/home_screen/widget/notification_icon_widget.dart';
import 'package:flutter_architecture/ui/fragments/home_screen/widget/shimmer_loader.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class HomeScreen extends StatelessWidget {
  final ScrollController controller = ScrollController();
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      disposeViewModel: false,
      fireOnModelReadyOnce: true,
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: ColorConfig.primaryColor,
          drawerEnableOpenDragGesture: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                'icons/menu.png',
                color: const Color(0xff5F5B5B),
              ),
            ),
            title: Text(
              "Home",
              style: GoogleFonts.poppins(
                  color: const Color(0xff5F5B5B),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: NotificationIconWidget(),
              ),
            ],
          ),
          body: SingleChildScrollView(
            key: PageStorageKey('page_1'),
            controller: model.controllerS,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 170,
                      child: PageView.builder(
                        key: PageStorageKey('image_slider'),
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'icons/banner.png',
                                  fit: BoxFit.cover,
                                )),
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
                              dotHeight: 7,
                              dotWidth: 7,
                              dotColor: ColorConfig.primaryColor,
                              activeDotColor: ColorConfig.greyColor,
                              spacing: 5),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "Available for Adoption",
                        style: GoogleFonts.poppins(
                          color: const Color(0xff5F5B5B),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: StickyHeader(
                        overlapHeaders: true,
                        header: Container(
                          decoration: model.elevationToTab
                              ? BoxDecoration(
                                  color: ColorConfig.primaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorConfig.greyColor4,
                                      offset: const Offset(1, 1),
                                      blurRadius: 2,
                                    ),
                                  ],
                                )
                              : const BoxDecoration(),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15, bottom: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                height: 40,
                                child: ListView.builder(
                                  key: PageStorageKey('one'),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: model.listOfCategory.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () async {
                                        if (model.selectedCategory !=
                                            model.listOfCategory[index].name) {
                                          await model.selectCategory(
                                              model.listOfCategory[index].name);
                                          await model.jumpTo();
                                        }
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: model.listOfCategory[index]
                                                        .name ==
                                                    model.selectedCategory
                                                ? ColorConfig.accentColor
                                                : ColorConfig.backgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 7),
                                                  child: SvgPicture.asset(
                                                    model.listOfCategory[index]
                                                        .image,
                                                    color: model
                                                                .listOfCategory[
                                                                    index]
                                                                .name ==
                                                            model
                                                                .selectedCategory
                                                        ? ColorConfig
                                                            .primaryColor
                                                        : const Color(
                                                            0xff5F5B5B),
                                                  ),
                                                ),
                                                Text(
                                                  model.listOfCategory[index]
                                                      .name,
                                                  style: GoogleFonts.rubik(
                                                    fontSize: 12,
                                                    color: model
                                                                .listOfCategory[
                                                                    index]
                                                                .name ==
                                                            model
                                                                .selectedCategory
                                                        ? Colors.white
                                                        : const Color(
                                                            0xff5F5B5B),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        content: Padding(
                          padding: const EdgeInsets.only(top: 45),
                          child: FutureBuilder<List<PetModel>>(
                            future: model.future,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const ShimmerLoader();
                              }

                              List<PetModel> listOfPet = snapshot.data ?? [];

                              if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              } else {
                                return GridView.builder(
                                    key: PageStorageKey('two'),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisExtent: 240),
                                    shrinkWrap: true,
                                    itemCount: listOfPet.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: ColorConfig.primaryColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade200,
                                                offset: const Offset(0, 10),
                                                blurRadius: 10,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: Stack(
                                                  children: [
                                                    GestureDetector(
                                                      child: Center(
                                                        child: SizedBox(
                                                          height: 140,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              child:
                                                                  CachedNetworkImage(
                                                                key:
                                                                    UniqueKey(),
                                                                imageUrl: listOfPet[
                                                                        index]
                                                                    .thumbnail[
                                                                        0]
                                                                    .downloadUrl,
                                                                // ignore: dead_null_aware_expression
                                                                fit: BoxFit
                                                                    .cover,
                                                                placeholder:
                                                                    (context,
                                                                            url) =>
                                                                        Center(
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              10),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              10),
                                                                    ),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          140,
                                                                      child: Image
                                                                          .asset(
                                                                        "icons/placeholder.png",
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                errorWidget:
                                                                    (context,
                                                                        url,
                                                                        error) {
                                                                  return Center(
                                                                    child: Icon(
                                                                      Icons
                                                                          .error_outline,
                                                                      color: Colors
                                                                              .redAccent[
                                                                          100],
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // onTap: model.navigate,
                                                    ),
                                                    Positioned(
                                                      top: 10,
                                                      right: 10,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: Colors.grey
                                                              .withOpacity(0.8),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 3,
                                                                  horizontal:
                                                                      8),
                                                          child: Text(
                                                            listOfPet[index]
                                                                .status,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 10,
                                                              color: ColorConfig
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0, bottom: 5),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      '${listOfPet[index].gender}, ',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: const Color(
                                                            0xff5F5B5B),
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    Text(
                                                      listOfPet[index].age,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: const Color(
                                                            0xff5F5B5B),
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  listOfPet[index].name,
                                                  style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xff333333),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  listOfPet[index].type,
                                                  style: GoogleFonts.poppins(
                                                      color: const Color(
                                                          0xff5F5B5B),
                                                      fontSize: 10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }
                            },
                          ),
                        ),
                        callback: (d) {
                          WidgetsBinding.instance.addPostFrameCallback(
                            (_) {
                              if (d <= -0.1) {
                                model.giveElevationToTab(true);
                              } else {
                                model.giveElevationToTab(false);
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => locator<HomeScreenViewModel>(),
    );
  }
}
