import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/locator.dart';
import 'package:flutter_architecture/extra_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class ExtraScreen extends StatelessWidget {
  const ExtraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExtraScreenViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => locator<ExtraScreenViewModel>(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.cyan[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CupertinoButton(
                color: Colors.cyanAccent,
                child: Text(
                  'Basic',
                  style: GoogleFonts.aBeeZee(color: Colors.cyan.shade700),
                ),
                onPressed: () => model.basicDialog(),
              ),
              CupertinoButton(
                color: Colors.cyanAccent,
                child: Text(
                  'Custom',
                  style: GoogleFonts.aBeeZee(color: Colors.cyan.shade800),
                ),
                onPressed: () => model.showCustomDialog(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
