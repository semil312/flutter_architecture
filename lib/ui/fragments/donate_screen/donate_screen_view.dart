// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_architecture/base/app_setup.locator.dart';
import 'package:flutter_architecture/config/color_config.dart';
import 'package:flutter_architecture/model/funding_model.dart';
import 'package:flutter_architecture/ui/fragments/donate_screen/donate_screen_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class DonateScreen extends StatelessWidget {
  PanelController panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorConfig.primaryColor,
      body: Stack(
        children: [
          SlidingUpPanel(
            key: PageStorageKey('donate_one'),
            controller: panelController,
            minHeight: height * 0.65,
            maxHeight: height * 0.85,
            parallaxEnabled: true,
            panelBuilder: (ScrollController controller) =>
                slidingPanel(scrollController: controller),
            body: Image.network(
              key: PageStorageKey("donate_two"),
              "https://images.unsplash.com/photo-1472491235688-bdc81a63246e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHVzc3l8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60",
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                height: 40,
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text(
                    "Donate Now",
                    style: GoogleFonts.aBeeZee(),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Thank You..",
                          style: GoogleFonts.aBeeZee(),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget slidingPanel({
    ScrollController? scrollController,
  }) =>
      ViewModelBuilder<DonateScreenViewModel>.reactive(
        disposeViewModel: false,
        fireOnModelReadyOnce: true,
        initialiseSpecialViewModelsOnce: true,
        onModelReady: (model) => model.raisedAmount(),
        builder: (context, model, child) {
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView(
              key: PageStorageKey('donate_three'),
              controller: scrollController,
              children: [
                FutureBuilder<List<FundingModel>>(
                  future: model.future,
                  builder: (context, snapshot) {
                    List<FundingModel> funds = snapshot.data ?? [];

                    double percent = model.raisedFund(
                        funds.isEmpty ? 2000 : funds[1].goal,
                        funds.isEmpty ? 1000 : funds[1].raised);

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Wrapper(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 200,
                                        color: Colors.black38,
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        height: 15,
                                        width: 150,
                                        color: Colors.black38,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Wrapper(
                                      child: Container(
                                        height: 10,
                                        width: 70,
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Wrapper(
                              child: Container(
                                height: 8,
                                width: double.maxFinite,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrapper(
                                  child: Container(
                                    height: 20,
                                    width: 150,
                                    color: Colors.black38,
                                  ),
                                ),
                                Wrapper(
                                  child: Container(
                                    height: 20,
                                    width: 160,
                                    color: Colors.black38,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Wrapper(
                              child: Container(
                                height: 260,
                                width: double.maxFinite,
                                color: Colors.black38,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return SingleChildScrollView(
                        key: PageStorageKey('donate_four'),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 60),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15,
                                        bottom: 15,
                                        right: 15,
                                        top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Help Homeless animal \nto Find a new Home",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            final Uri url = Uri.parse(
                                                'https://www.timminshumane5050.ca/');
                                            if (!await launchUrl(url,
                                                mode: LaunchMode
                                                    .externalNonBrowserApplication)) {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: Text(
                                              "Learn more",
                                              style: GoogleFonts.poppins(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    const Color(0xff3491C6),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: const Color(0xff3491C6),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      LinearPercentIndicator(
                                        animation: true,
                                        animationDuration: 1500,
                                        lineHeight: 8,
                                        percent: percent / 100,
                                        backgroundColor:
                                            const Color(0x30376560),
                                        progressColor: Colors.blueGrey,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Goals: \$${funds.isEmpty ? 2000 : funds[0].goal}/month",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "Raised: \$${funds.isEmpty ? 1000 : funds[0].raised} (\$$percent%)",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      ColorConfig.accentColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Container(
                                      height: 1,
                                      width: double.maxFinite,
                                      color: const Color(0x10376560),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    child: Text(
                                      "In addition to being an adoption center, we also provide animal control services for the City of Timmins as well as assisting the provincial government with animal cruelty and neglect cases. All adoptable animals that come into the shelter — whether as strays unclaimed by their owners, those who can no longer take care of their pets or through welfare investigations — are put up for adoption and await their forever homes at our facility. We have an experienced team including veterinary technicians and veterinarians along with our cleaning crew, reception staff, and management."
                                      "\n\nIn addition to being an adoption center, we also provide animal control services for the City of Timmins as well as assisting the provincial government with animal cruelty and neglect cases. All adoptable animals that come into the shelter — whether as strays unclaimed by their owners, those who can no longer take care of their pets or through welfare investigations — are put up for adoption and await their forever homes at our facility. We have an experienced team including veterinary technicians and veterinarians along with our cleaning crew, reception staff, and management,"
                                      "\n\nIn addition to being an adoption center, we also provide animal control services for the City of Timmins as well as assisting the provincial government with animal cruelty and neglect cases. All adoptable animals that come into the shelter — whether as strays unclaimed by their owners, those who can no longer take care of their pets or through welfare investigations — are put up for adoption and await their forever homes at our facility. We have an experienced team including veterinary technicians and veterinarians along with our cleaning crew, reception staff, and management.",
                                      style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xffA1A1A1)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
        viewModelBuilder: () => locator<DonateScreenViewModel>(),
      );
}

class Wrapper extends StatelessWidget {
  Widget child;

  Wrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[200]!,
      child: child,
    );
  }
}
