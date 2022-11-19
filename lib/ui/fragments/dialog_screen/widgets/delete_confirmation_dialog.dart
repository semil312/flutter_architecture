import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/color_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DeleteConfirmationDialog(
      {required this.request, required this.completer});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.white),
          child: Padding(
            padding: EdgeInsets.only(left: 18, right: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CircleAvatar(
                    radius: 28.0,
                    backgroundColor: const Color(0xffFE7886),
                    child: Image.asset(
                      request.data?.icon ?? "icons/trash.png",
                      color: Colors.white,
                      width: 26,
                    ),
                  ),
                ),
                Text(
                  request.title ?? 'Are you sure?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff404446)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    request.description ??
                        'Your transaction amount is more than your account balance. You have zero balance in your account. Are you sure to continue this transaction?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff72777A)),
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    "Delete",
                    style: GoogleFonts.aBeeZee(),
                  ),
                  onPressed: () {
                    completer(DialogResponse(confirmed: true));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextButton(
                    onPressed: () {
                      completer(DialogResponse(confirmed: false));
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                    ),
                    child: Text(
                      "Go Back",
                      style: TextStyle(
                        color: ColorConfig.accentColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
