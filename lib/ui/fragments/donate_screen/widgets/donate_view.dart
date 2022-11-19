import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/color_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DonationView extends StatelessWidget {
  const DonationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Help Homless animal \nto Find a new Home",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "Learn more",
                            style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
                              decorationColor: const Color(0xff3491C6),
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: const Color(0xff3491C6),
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
                        restartAnimation: true,
                        lineHeight: 8,
                        percent: 0.5,
                        backgroundColor: const Color(0x30376560),
                        progressColor: ColorConfig.accentColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Goals: \$2000/month",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Text(
                              "Raised: \$1000 (\$50.0%)",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ColorConfig.accentColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
          ),
        ],
      ),
    );
  }
}
