import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/color_config.dart';
import 'package:flutter_architecture/model/pet_model.dart';
import 'package:flutter_architecture/ui/about_cat_screen/about_cat_screen_view_model.dart';
import 'package:flutter_architecture/ui/about_cat_screen/widget/about_cat.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class PetDetails extends StatefulWidget {
  const PetDetails({Key? key}) : super(key: key);

  @override
  State<PetDetails> createState() => _PetDetailsState();
}

class _PetDetailsState extends State<PetDetails> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AboutCatScreenViewModel>.reactive(
      viewModelBuilder: () => AboutCatScreenViewModel(),
      builder: (context, model, child) {
        final arguments =
            ModalRoute.of(context)?.settings.arguments as PetModel;

        List<dynamic> aboutList = [];

        aboutList = model.convertMapToList(arguments.about);

        return Scaffold(
          backgroundColor: ColorConfig.primaryColor,
          body: Padding(
            padding: const EdgeInsets.all(18),
            child: Container(
              decoration: BoxDecoration(
                color: ColorConfig.primaryColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              arguments.name,
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Row(
                                children: [
                                  Text(
                                    arguments.type,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff5F5F63),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 6, right: 6, top: 2),
                                    child: CircleAvatar(
                                      radius: 1.3,
                                      backgroundColor: Color(0xff5F5F63),
                                    ),
                                  ),
                                  Text(
                                    arguments.age,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff5F5F63),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SvgPicture.asset(arguments.gender == "Female"
                            ? "images/female.svg"
                            : "images/male.svg")
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 5, bottom: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SvgPicture.asset("images/paw.svg"),
                          ),
                          Text(
                            "About Pet",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Wrap(
                      children: [
                        for (var i = 0; i < aboutList.length; i++)
                          AboutPet(
                            data: aboutList[i].keys.toString().substring(
                                1, aboutList[i].keys.toString().length - 1),
                            value: aboutList[i][aboutList[i]
                                    .keys
                                    .toString()
                                    .substring(
                                        1,
                                        aboutList[i].keys.toString().length -
                                            1)]
                                .toString(),
                          )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "Corny is incredibly and unconditionally loyal cat. He loves everyone as much as everyone love him or sometimes more.",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color(0xffA1A1A1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 15, top: 20, left: 5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SvgPicture.asset("images/smileys.svg"),
                          ),
                          Text(
                            "Pet Behavior",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 70),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (var i = 0; i < arguments.detail!.length; i++)
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: ColorConfig.accentColor)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 15),
                                child: Text(
                                  arguments.detail![i],
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: const Color(0xff5F5F63)),
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
