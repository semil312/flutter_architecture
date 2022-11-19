import 'package:flutter_architecture/app/locator.dart';
import 'package:flutter_architecture/base/app_setup.router.dart';
import 'package:flutter_architecture/enums/bottom_sheet_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BottomSheetScreenViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  late bool? _confirmationResult;

  bool? get confirmationResult => _confirmationResult;

  Future showBasicBottomSheet() async {
    await _bottomSheetService.showBottomSheet(
      title: "Basic Bottom Sheet..",
      description:
          "Bottom sheets are surfaces containing supplementary content that are anchored to the bottom of the screen.\nBottom sheets are surfaces containing supplementary content that are anchored to the bottom of the screen.",
    );
  }

  Future showConfirmationBottomSheet() async {
    final response = await _bottomSheetService.showBottomSheet(
        title: "Confirm Bottom Sheet..",
        description:
            "Bottom sheets are surfaces containing supplementary content that are anchored to the bottom of the screen.\nBottom sheets are surfaces containing supplementary content that are anchored to the bottom of the screen.",
        cancelButtonTitle: "Cancel",
        confirmButtonTitle: "Done");

    _confirmationResult = response?.confirmed;
    notifyListeners();
  }

  Future showCustomBottomSheet() async {
    final response =
        _bottomSheetService.showCustomSheet(variant: BottomSheetType.floating);
    return response;
  }

  Future noInternetBottomSheet() async {
    final response =
    _bottomSheetService.showCustomSheet(variant: BottomSheetType.noInternet);
    return response;
  }

  void navigate() {
    _navigationService.navigateTo(Routes.dialogScreen);
  }
}
