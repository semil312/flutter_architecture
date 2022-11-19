import 'package:flutter/material.dart';
import 'package:flutter_architecture/config/color_config.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:lottie/lottie.dart';

class SuccessDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  SuccessDialog({required this.request, required this.completer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Dialog(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              color: Colors.white,
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(left: 13, top: 10, right: 13, bottom: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Lottie.network(
                        'https://assets5.lottiefiles.com/packages/lf20_j3f6munv.json',
                        repeat: false,
                      ),
                    ),
                    Text(
                      request.title ?? "Success",
                      style: TextStyle(fontSize: 23),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      request.description ?? "Information saved Succesfully",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        letterSpacing: 0.8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 20, bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          completer(DialogResponse(confirmed: true));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            color: ColorConfig.accentColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Center(
                                child: Text(
                              request.mainButtonTitle ?? "OK",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
