import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/locator.dart';
import 'package:flutter_architecture/base/app_setup.router.dart';
import 'package:flutter_architecture/ui/bottom_sheet_screen/custom_bottom_sheet_ui.dart';
import 'package:flutter_architecture/ui/fragments/dialog_screen/custom_dialog_ui.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  customBottomSheetUi();
  setupCustomDialogUi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: Routes.mainScreen,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
