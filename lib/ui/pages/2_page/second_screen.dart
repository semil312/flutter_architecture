import 'package:flutter/material.dart';
import 'package:flutter_architecture/base/app_setup.locator.dart';
import 'package:flutter_architecture/ui/pages/2_page/second_screen_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SecondScreenViewModel>.reactive(
      viewModelBuilder: () => locator<SecondScreenViewModel>(),
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Second Screen",
            style: GoogleFonts.aBeeZee(),
          ),
        ),
        backgroundColor: Colors.blue[100],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Text("2",style: GoogleFonts.aBeeZee(),),
          onPressed: () => model.navigate(),
        ),
      ),
    );
  }
}
