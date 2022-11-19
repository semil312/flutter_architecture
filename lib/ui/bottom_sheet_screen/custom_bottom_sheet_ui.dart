import 'package:flutter_architecture/app/locator.dart';
import 'package:flutter_architecture/enums/bottom_sheet_type.dart';
import 'package:stacked_services/stacked_services.dart';

import 'widget/floating_bottom_sheet.dart';
import 'widget/no_internet_bottomsheet.dart';

void customBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.floating: (context, sheetRequest, completer) =>
        FloatingBoxBottomSheet(
          request: sheetRequest,
          completer: completer,
        ),
    BottomSheetType.noInternet: (context, sheetRequest, completer) =>
        NoInternetDialog(request: sheetRequest, completer: completer),
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
