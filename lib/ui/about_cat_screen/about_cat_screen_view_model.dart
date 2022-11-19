import 'package:stacked/stacked.dart';

class AboutCatScreenViewModel extends BaseViewModel {
  List convertMapToList(Map<String, dynamic>? map) {
    List list = [];

    map!.forEach((key, value) {
      Map m = {key: value};
      list.add(m);
    });
    notifyListeners();
    return list;
  }
}
