import 'dart:developer';

import 'package:flutter_architecture/base/app_setup.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'enums/dialog_types.dart';

class ExtraScreenViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

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

  Future showCustomDialog() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogTypes.basic,
      title: 'My custom dialog',
      description: 'This is my dialog description',
      mainButtonTitle: 'Confirm',
    );
    notifyListeners();

    log("RESPONSE : ${response.toString()}");

    return response;
  }
}
