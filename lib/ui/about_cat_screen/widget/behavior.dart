import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/color_config.dart';
import 'package:google_fonts/google_fonts.dart';

class Behavior extends StatelessWidget {
  final String name;

  const Behavior({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: ColorConfig.accentColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
          child: Text(
            name,
            style:
                GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
          ),
        ),
      ),
    );
  }
}
