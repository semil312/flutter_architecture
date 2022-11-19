import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/locator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'first_screen_view_model.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FirstScreenViewModel>.reactive(
      viewModelBuilder: () => locator<FirstScreenViewModel>(),
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            "First Screen",
            style: GoogleFonts.aBeeZee(),
          ),
        ),
        backgroundColor: Colors.deepPurple[100],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Text("1",style: GoogleFonts.aBeeZee(),),
          onPressed: () => model.navigate(),
        ),
      ),
    );
  }
}
