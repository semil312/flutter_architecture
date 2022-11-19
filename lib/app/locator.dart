import 'package:flutter_architecture/extra_view_model.dart';
import 'package:flutter_architecture/services/user_api_services.dart';
import 'package:flutter_architecture/ui/about_cat_screen/about_cat_screen_view_model.dart';
import 'package:flutter_architecture/ui/bottom_sheet_screen/bottom_sheet_screen_view_model.dart';
import 'package:flutter_architecture/ui/fragments/api_screen/api_screen_view_model.dart';
import 'package:flutter_architecture/ui/fragments/dialog_screen/dialog_screen_view_model.dart';
import 'package:flutter_architecture/ui/fragments/donate_screen/donate_screen_view_model.dart';
import 'package:flutter_architecture/ui/fragments/home_screen/home_screen_view_model.dart';
import 'package:flutter_architecture/ui/main_screen_view_model.dart';
import 'package:flutter_architecture/ui/pages/1_page/first_screen_view_model.dart';
import 'package:flutter_architecture/ui/pages/2_page/second_screen_view_model.dart';
import 'package:flutter_architecture/ui/pages/3_page/third_screen_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => ApiServices());

  locator
      .registerLazySingleton<MainScreenViewModel>(() => MainScreenViewModel());
  locator
      .registerLazySingleton<HomeScreenViewModel>(() => HomeScreenViewModel());
  locator.registerLazySingleton<DialogScreenViewModal>(
      () => DialogScreenViewModal());
  locator.registerLazySingleton<BottomSheetScreenViewModel>(
      () => BottomSheetScreenViewModel());
  locator.registerLazySingleton<ExtraScreenViewModel>(
      () => ExtraScreenViewModel());
  locator.registerLazySingleton<DonateScreenViewModel>(
      () => DonateScreenViewModel());
  locator.registerLazySingleton<AboutCatScreenViewModel>(
      () => AboutCatScreenViewModel());
  locator.registerLazySingleton<ApiScreenViewModel>(() => ApiScreenViewModel());
  locator.registerLazySingleton<FirstScreenViewModel>(
      () => FirstScreenViewModel());
  locator.registerLazySingleton<SecondScreenViewModel>(
      () => SecondScreenViewModel());
  locator.registerLazySingleton<ThirdScreenViewModel>(
      () => ThirdScreenViewModel());
}
