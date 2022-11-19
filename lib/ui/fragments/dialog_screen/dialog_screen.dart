import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dialog_screen_view_model.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DialogScreenViewModal>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(title: const Text("Stack Dialog")),
          floatingActionButton: FloatingActionButton(
            onPressed: model.navigate,
            backgroundColor: Colors.blueGrey,
            child: const Icon(CupertinoIcons.forward),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          body: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: CupertinoButton(
                  color: Colors.blueGrey,
                    onPressed: () {
                      model.basicDialog();
                    },
                    child: const Text("Basic Dialog")),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CupertinoButton(
                  color: Colors.blueGrey,
                    onPressed: () {
                      model.confirmDialog();
                    },
                    child: const Text("Confirm Dialog")),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CupertinoButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      model.showCustomDialog();
                    },
                    child: const Text("Custom Dialog")),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CupertinoButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      model.logoutDialog();
                    },
                    child: const Text("LogOut Dialog")),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CupertinoButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      model.successDialog();
                    },
                    child: const Text("Success Dialog")),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CupertinoButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      model.deleteConfirmationDialog();
                    },
                    child: const Text("Delete Dialog")),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => DialogScreenViewModal(),
    );
  }
}
