import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/base/app_setup.locator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'bottom_sheet_screen_view_model.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomSheetScreenViewModel>.reactive(
      viewModelBuilder: () => locator<BottomSheetScreenViewModel>(),
      disposeViewModel: false,
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Bottom Sheet'),
            leading: Icon(Icons.file_copy_outlined),
          ),
          backgroundColor: Colors.blueGrey[50],
          floatingActionButton: FloatingActionButton(
            onPressed: model.navigate,
            backgroundColor: Colors.blueGrey,
            child: const Icon(CupertinoIcons.forward),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                  color: Colors.blueGrey,
                  onPressed: model.showBasicBottomSheet,
                  child: Text(
                    'Basic Bottom Sheet',
                    style: GoogleFonts.aBeeZee(),
                  ),
                ),
                CupertinoButton(
                  color: Colors.blueGrey,
                  onPressed: model.showConfirmationBottomSheet,
                  child: Text(
                    'Confirmation Bottom Sheet',
                    style: GoogleFonts.aBeeZee(),
                  ),
                ),
                CupertinoButton(
                  color: Colors.blueGrey,
                  onPressed: model.showCustomBottomSheet,
                  child: Text(
                    'Custom Bottom Sheet',
                    style: GoogleFonts.aBeeZee(),
                  ),
                ),
                CupertinoButton(
                  color: Colors.blueGrey,
                  onPressed: model.noInternetBottomSheet,
                  child: Text(
                    'No Internet Sheet',
                    style: GoogleFonts.aBeeZee(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
