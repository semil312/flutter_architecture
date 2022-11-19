import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/color_config.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPet extends StatelessWidget {
  final String data, value;

  const AboutPet({
    super.key,
    required this.data,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0x304ACF87)),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.trim(),
                style: GoogleFonts.poppins(
                    fontSize: 13, color: ColorConfig.greyColor),
              ),
              Text(
                value.trim(),
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: ColorConfig.accentColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
