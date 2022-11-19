import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';

class BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  BasicDialog({
    required this.request,
    required this.completer,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              request.title!,
              style: GoogleFonts.bebasNeue(
                fontWeight: FontWeight.w400,
                fontSize: 23,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              request.description!,
              style: GoogleFonts.aBeeZee(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              // Complete the dialog when you're done with it to return some data
              onTap: () => completer(DialogResponse(confirmed: true)),
              child: Container(
                child: request.showIconInMainButton!
                    ? Icon(Icons.check_circle)
                    : Text(request.mainButtonTitle!),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
