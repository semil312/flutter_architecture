import 'package:flutter_architecture/app/locator.dart';
import 'package:flutter_architecture/enums/dialog_types.dart';
import 'package:flutter_architecture/ui/fragments/dialog_screen/widgets/basic_dialog.dart';
import 'package:flutter_architecture/ui/fragments/dialog_screen/widgets/delete_confirmation_dialog.dart';
import 'package:flutter_architecture/ui/fragments/dialog_screen/widgets/form_dialog.dart';
import 'package:flutter_architecture/ui/fragments/dialog_screen/widgets/logout_dialog.dart';
import 'package:flutter_architecture/ui/fragments/dialog_screen/widgets/success_dialog.dart';
import 'package:stacked_services/stacked_services.dart';

void setupCustomDialogUi() {
  final dialogService = locator<DialogService>();

  final builder = {
    DialogTypes.basic: (context, sheetRequest, completer) {
      return BasicDialog(
        completer: completer,
        request: sheetRequest,
      );
    },
    DialogTypes.form: (context, sheetRequest, completer) {
      return FormDialog(
        completer: completer,
        request: sheetRequest,
      );
    },
    DialogTypes.saveOrNot: (context, sheetRequest, completer) {
      return LogoutDialog(
        request: sheetRequest,
        completer: completer,
      );
    },
    DialogTypes.success: (context, sheetRequest, completer) {
      return SuccessDialog(
        request: sheetRequest,
        completer: completer,
      );
    },
    DialogTypes.deleteConfirmation: (context, sheetRequest, completer) {
      return DeleteConfirmationDialog(
        request: sheetRequest,
        completer: completer,
      );
    }
  };
  dialogService.registerCustomDialogBuilders(builder);
}
