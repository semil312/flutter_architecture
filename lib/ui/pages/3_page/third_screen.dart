import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/locator.dart';
import 'package:flutter_architecture/ui/pages/3_page/third_screen_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThirdScreenViewModel>.reactive(
      viewModelBuilder: () => locator<ThirdScreenViewModel>(),
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Third Screen",
            style: GoogleFonts.aBeeZee(),
          ),
        ),
        backgroundColor: Colors.green[100],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Text(
            "3",
            style: GoogleFonts.aBeeZee(),
          ),
          onPressed: () => model.navigate(),
        ),
      ),
    );
  }
}
