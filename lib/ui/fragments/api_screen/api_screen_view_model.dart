import 'package:flutter_architecture/base/app_setup.locator.dart';
import 'package:flutter_architecture/model/user_data_model.dart';
import 'package:flutter_architecture/services/user_api_services.dart';
import 'package:stacked/stacked.dart';

class ApiScreenViewModel extends BaseViewModel {
  ApiServices userApiServices = locator<ApiServices>();
  bool busiya = false;
  List<UserDataModal> userData = [];

  Future<void> getUserData() async {
    userData = await userApiServices.getUserData();
    busiya = true;
    notifyListeners();
  }
}
