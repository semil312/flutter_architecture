
// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/color_config.dart';
import 'package:flutter_architecture/model/pet_model.dart';
import 'package:google_fonts/google_fonts.dart';

class PetList extends StatefulWidget {
  Future<List<PetModel>>? viewModel;

  PetList(this.viewModel);

  @override
  State<PetList> createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PetModel>>(
      future: widget.viewModel,
      builder: (context, snapshot) {
        List<PetModel> listOfPet = snapshot.data ?? [];

        if (!snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Center(
              child: CircularProgressIndicator(
                color: ColorConfig.accentColor,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return Padding(
            padding: EdgeInsets.only(top: 120),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 240,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listOfPet.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Stack(
                              children: [
                                GestureDetector(
                                  child: Center(
                                    child: SizedBox(
                                      height: 140,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            key: UniqueKey(),
                                            imageUrl: listOfPet[index]
                                                .images[0]
                                                .downloadURL,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) => Center(
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                child: SizedBox(
                                                  height: 140,
                                                  child: Image.asset(
                                                    "images/placeholder.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            errorWidget: (context, url, error) {
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  color: ColorConfig.accentColor,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      "about_cat",
                                      arguments: listOfPet[index],
                                    );
                                  },
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.withOpacity(0.8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 8),
                                      child: Text(
                                        listOfPet[index].status,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                          color: ColorConfig.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom: 5),
                            child: Row(
                              children: [
                                Text(
                                  '${listOfPet[index].gender}, ',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xff5F5B5B),
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  listOfPet[index].age,
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xff5F5B5B),
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              listOfPet[index].name,
                              style: GoogleFonts.poppins(
                                color: const Color(0xff333333),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              listOfPet[index].type,
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff5F5B5B), fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
