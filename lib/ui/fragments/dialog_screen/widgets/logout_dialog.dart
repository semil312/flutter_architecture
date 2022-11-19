import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/color_config.dart';
import 'package:stacked_services/stacked_services.dart';

class LogoutDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  LogoutDialog({required this.request, required this.completer});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 13, top: 13, right: 21, bottom: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.power_settings_new,
                          color: Colors.red),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        request.title ?? "Are you sure",
                        style: TextStyle(
                          fontSize: 21,
                          color: ColorConfig.greyColor,
                          fontFamily: 'ProximaNova',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    request.description ?? "Are you sure you want to logout?",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'ProximaNova'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.white,
                          elevation: 0),
                      onPressed: () {
                        DialogResponse dialogResponse =
                        DialogResponse(confirmed: false);
                        completer(dialogResponse);
                      },
                      child: Text(
                        'NO',
                        style: TextStyle(
                            color: ColorConfig.greyColor, fontSize: 18.0),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, elevation: 0),
                        onPressed: () async {
                          DialogResponse _dialogResponse =
                          DialogResponse(confirmed: true);
                          completer(_dialogResponse);
                        },
                        child: const Text(
                          'YES',
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                        )),
                    const SizedBox(
                      width: 17,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}