import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/color_config.dart';
import 'package:flutter_architecture/model/adoption_category_model.dart';
import 'package:google_fonts/google_fonts.dart';

class AdoptionCategoriesList extends StatelessWidget {
  List<AdoptionCategoryModel> listOfCategory;
  Function(AdoptionCategoryModel categoryModel) categorySelecteCallback;
  AdoptionCategoryModel selectedCategory;

  AdoptionCategoriesList({
    Key? key,
    required this.listOfCategory,
    required this.categorySelecteCallback,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: listOfCategory.length,
          itemBuilder: (BuildContext context, int index) {
            return Pet(
              name: listOfCategory[index].name,
              isSelected: listOfCategory[index].name == selectedCategory.name,
              onTap: () {
                categorySelecteCallback(listOfCategory[index]);
              },
              image: listOfCategory[index].image,
            );
          },
        ),
      ),
    );
  }
}

class Pet extends StatelessWidget {
  final String name;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  const Pet({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? ColorConfig.accentColor
                : ColorConfig.backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: Image.asset(
                    image,
                    color: isSelected
                        ? ColorConfig.primaryColor
                        : const Color(0xff5F5B5B),
                  ),
                ),
                Text(
                  name,
                  style: GoogleFonts.rubik(
                    fontSize: 12,
                    color: isSelected ? Colors.white : const Color(0xff5F5B5B),
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
