import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class FormDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  FormDialog({
    required this.request,
    required this.completer,
  });

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              request.title!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              // Complete the dialog when you're done with it to return some data
              onTap: () =>
                  completer(DialogResponse(data: [controller.text])),
              child: Container(
                child: request.showIconInMainButton!
                    ? Icon(Icons.check_circle)
                    : Text(request.mainButtonTitle!),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
