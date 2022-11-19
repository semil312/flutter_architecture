import 'package:flutter_architecture/model/funding_model.dart';
import 'package:flutter_architecture/services/firebase_services/fund_firebase_service.dart';
import 'package:stacked/stacked.dart';

class DonateScreenViewModel extends BaseViewModel {
  FundFirebaseService fundFirebaseService = FundFirebaseService();
  Future<List<FundingModel>>? future;

  raisedAmount() async {
    future = fundFirebaseService.getFunds();
    notifyListeners();
  }

  raisedFund(int goal, int raised) {
    double percent = raised * 100 / goal;
    return percent;
  }
}
