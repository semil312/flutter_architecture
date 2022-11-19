import 'package:flutter_architecture/base/app_setup.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ThirdScreenViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();

  void navigate() {
    navigationService.popRepeated(5);
  }
}
