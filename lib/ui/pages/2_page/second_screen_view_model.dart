import 'package:flutter_architecture/base/app_setup.locator.dart';
import 'package:flutter_architecture/base/app_setup.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SecondScreenViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();

  void navigate() {
    navigationService.navigateTo(Routes.thirdScreen);
  }
}
