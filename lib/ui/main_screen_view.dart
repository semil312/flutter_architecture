import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/base/app_setup.locator.dart';
import 'package:flutter_architecture/config/color_config.dart';
import 'package:flutter_architecture/ui/bottom_sheet_screen/bottom_sheet_screen.dart';
import 'package:flutter_architecture/ui/fragments/dialog_screen/dialog_screen.dart';
import 'package:flutter_architecture/ui/fragments/donate_screen/donate_screen_view.dart';
import 'package:flutter_architecture/ui/fragments/home_screen/home_screen_view.dart';
import 'package:flutter_architecture/ui/main_screen_view_model.dart';
import 'package:stacked/stacked.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainScreenViewModel>.reactive(
      viewModelBuilder: () => locator<MainScreenViewModel>(),
      builder: (context, model, child) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.blueGrey[50],
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
            fixedColor: ColorConfig.accentColor,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: ColorConfig.accentColor,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.color_filter,
                  color: ColorConfig.accentColor,
                ),
                label: 'Donate',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.file_copy_outlined,
                  color: ColorConfig.accentColor,
                ),
                label: 'Bottom Sheet',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                  color: ColorConfig.accentColor,
                ),
                label: 'Dialog',
              ),
            ],
          ),
          body: getViewForIndex(model.currentIndex),
        );
      },
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return DonateScreen();
      case 2:
        return BottomSheetScreen();
      case 3:
        return DialogScreen();
      default:
        return HomeScreen();
    }
  }
}
