import 'dart:developer';

import 'package:flutter_architecture/app/locator.dart';
import 'package:flutter_architecture/base/app_setup.router.dart';
import 'package:flutter_architecture/enums/dialog_types.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DialogScreenViewModal extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  Future basicDialog() async {
    await _dialogService.showDialog(
        dialogPlatform: DialogPlatform.Material,
        title: "Hello",
        description:
            "The dialog is a type of widget which comes on the window or the screen which contains any critical information or can ask for any decision.",
        buttonTitle: "Submit",
        barrierDismissible: true);

    notifyListeners();
  }

  Future confirmDialog() async {
    var response = await _dialogService.showConfirmationDialog(
        dialogPlatform: DialogPlatform.Material,
        title: "Confirm Dialog",
        description:
            "The dialog is a type of widget which comes on the window or the screen which contains any critical information or can ask for any decision.",
        confirmationTitle: "Yes",
        cancelTitle: "No",
        barrierDismissible: true);
    log("Dialog Response : ${response?.confirmed}");
    notifyListeners();
  }

  Future showCustomDialog() async {
    var response = await _dialogService.showCustomDialog(
        variant: DialogTypes.basic,
        mainButtonTitle: 'Confirm',
        description: "This is the Custom Dialog",
        title: "Dialog");
    notifyListeners();
    return response;
  }

  Future successDialog() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogTypes.success,
    );
    notifyListeners();
    return response;
  }

  Future logoutDialog() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogTypes.saveOrNot,
    );
    notifyListeners();
    return response;
  }

  Future deleteConfirmationDialog() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogTypes.deleteConfirmation,
    );
    notifyListeners();
    return response;
  }

  void navigate() {
    _navigationService.navigateTo(Routes.mainScreen);
  }

  void navigateBack() {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeScreen);
  }
}
