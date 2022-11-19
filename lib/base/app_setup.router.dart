// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/cupertino.dart' as _i13;
import 'package:flutter/material.dart';
import 'package:flutter_architecture/extra.dart' as _i5;
import 'package:flutter_architecture/ui/about_cat_screen/about_cat_screen_view.dart'
    as _i8;
import 'package:flutter_architecture/ui/bottom_sheet_screen/bottom_sheet_screen.dart'
    as _i7;
import 'package:flutter_architecture/ui/fragments/api_screen/api_screen.dart'
    as _i9;
import 'package:flutter_architecture/ui/fragments/dialog_screen/dialog_screen.dart'
    as _i4;
import 'package:flutter_architecture/ui/fragments/donate_screen/donate_screen_view.dart'
    as _i6;
import 'package:flutter_architecture/ui/fragments/home_screen/home_screen_view.dart'
    as _i3;
import 'package:flutter_architecture/ui/main_screen_view.dart' as _i2;
import 'package:flutter_architecture/ui/pages/1_page/first_screen.dart' as _i10;
import 'package:flutter_architecture/ui/pages/2_page/second_screen.dart'
    as _i11;
import 'package:flutter_architecture/ui/pages/3_page/third_screen.dart' as _i12;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i14;

class Routes {
  static const mainScreen = '/';

  static const homeScreen = '/home-screen';

  static const dialogScreen = '/dialog-screen';

  static const extraScreen = '/extra-screen';

  static const donateScreen = '/donate-screen';

  static const bottomSheetScreen = '/bottom-sheet-screen';

  static const aboutCatScreen = '/about-cat-screen';

  static const apiScreen = '/api-screen';

  static const firstScreen = '/first-screen';

  static const secondScreen = '/second-screen';

  static const thirdScreen = '/third-screen';

  static const all = <String>{
    mainScreen,
    homeScreen,
    dialogScreen,
    extraScreen,
    donateScreen,
    bottomSheetScreen,
    aboutCatScreen,
    apiScreen,
    firstScreen,
    secondScreen,
    thirdScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.mainScreen,
      page: _i2.MainScreen,
    ),
    _i1.RouteDef(
      Routes.homeScreen,
      page: _i3.HomeScreen,
    ),
    _i1.RouteDef(
      Routes.dialogScreen,
      page: _i4.DialogScreen,
    ),
    _i1.RouteDef(
      Routes.extraScreen,
      page: _i5.ExtraScreen,
    ),
    _i1.RouteDef(
      Routes.donateScreen,
      page: _i6.DonateScreen,
    ),
    _i1.RouteDef(
      Routes.bottomSheetScreen,
      page: _i7.BottomSheetScreen,
    ),
    _i1.RouteDef(
      Routes.aboutCatScreen,
      page: _i8.AboutCatScreen,
    ),
    _i1.RouteDef(
      Routes.apiScreen,
      page: _i9.ApiScreen,
    ),
    _i1.RouteDef(
      Routes.firstScreen,
      page: _i10.FirstScreen,
    ),
    _i1.RouteDef(
      Routes.secondScreen,
      page: _i11.SecondScreen,
    ),
    _i1.RouteDef(
      Routes.thirdScreen,
      page: _i12.ThirdScreen,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.MainScreen: (data) {
      final args = data.getArgs<MainScreenArguments>(
        orElse: () => const MainScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i2.MainScreen(key: args.key),
        settings: data,
      );
    },
    _i3.HomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i3.HomeScreen(),
        settings: data,
      );
    },
    _i4.DialogScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.DialogScreen(),
        settings: data,
      );
    },
    _i5.ExtraScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.ExtraScreen(),
        settings: data,
      );
    },
    _i6.DonateScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i6.DonateScreen(),
        settings: data,
      );
    },
    _i7.BottomSheetScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.BottomSheetScreen(),
        settings: data,
      );
    },
    _i8.AboutCatScreen: (data) {
      final args = data.getArgs<AboutCatScreenArguments>(
        orElse: () => const AboutCatScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i8.AboutCatScreen(key: args.key),
        settings: data,
      );
    },
    _i9.ApiScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i9.ApiScreen(),
        settings: data,
      );
    },
    _i10.FirstScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.FirstScreen(),
        settings: data,
      );
    },
    _i11.SecondScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.SecondScreen(),
        settings: data,
      );
    },
    _i12.ThirdScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.ThirdScreen(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MainScreenArguments {
  const MainScreenArguments({this.key});

  final _i13.Key? key;
}

class AboutCatScreenArguments {
  const AboutCatScreenArguments({this.key});

  final _i13.Key? key;
}

extension NavigatorStateExtension on _i14.NavigationService {
  Future<dynamic> navigateToMainScreen({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mainScreen,
        arguments: MainScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDialogScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dialogScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToExtraScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.extraScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDonateScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.donateScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBottomSheetScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bottomSheetScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAboutCatScreen({
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.aboutCatScreen,
        arguments: AboutCatScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToApiScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.apiScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFirstScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.firstScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSecondScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.secondScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToThirdScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.thirdScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
