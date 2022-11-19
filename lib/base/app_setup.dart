import 'package:flutter_architecture/extra.dart';
import 'package:flutter_architecture/ui/about_cat_screen/about_cat_screen_view.dart';
import 'package:flutter_architecture/ui/bottom_sheet_screen/bottom_sheet_screen.dart';
import 'package:flutter_architecture/ui/fragments/api_screen/api_screen.dart';
import 'package:flutter_architecture/ui/fragments/dialog_screen/dialog_screen.dart';
import 'package:flutter_architecture/ui/fragments/donate_screen/donate_screen_view.dart';
import 'package:flutter_architecture/ui/fragments/home_screen/home_screen_view.dart';
import 'package:flutter_architecture/ui/main_screen_view.dart';
import 'package:flutter_architecture/ui/pages/1_page/first_screen.dart';
import 'package:flutter_architecture/ui/pages/2_page/second_screen.dart';
import 'package:flutter_architecture/ui/pages/3_page/third_screen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: MainScreen, initial: true),
    MaterialRoute(page: HomeScreen),
    MaterialRoute(page: DialogScreen),
    MaterialRoute(page: ExtraScreen),
    MaterialRoute(page: DonateScreen),
    MaterialRoute(page: BottomSheetScreen),
    MaterialRoute(page: AboutCatScreen),
    MaterialRoute(page: ApiScreen),
    MaterialRoute(page: FirstScreen),
    MaterialRoute(page: SecondScreen),
    MaterialRoute(page: ThirdScreen),
  ],
  dependencies: [
    LazySingleton(
      classType: NavigationService,
    )
  ],
)
class App {}
