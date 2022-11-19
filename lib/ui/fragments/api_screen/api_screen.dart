import 'package:flutter/material.dart';
import 'package:flutter_architecture/base/app_setup.locator.dart';
import 'package:flutter_architecture/ui/fragments/api_screen/api_screen_view_model.dart';
import 'package:stacked/stacked.dart';

class ApiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ApiScreenViewModel>.reactive(
        onModelReady: (model) {
          model.getUserData();
        },
        disposeViewModel: false,
        // initialiseSpecialViewModelsOnce: true,
        fireOnModelReadyOnce: true,
        builder: (context, model, child) {
          return Scaffold(
            body: model.busiya
                ? ListView.builder(
                    key: const PageStorageKey('storage-key'),
                    itemCount: model.userData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          model.userData[index].name,
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          model.userData[index].email,
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Center(
                              child: Text(
                            model.userData[index].name
                                .substring(0, 1)
                                .toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                      );
                    },
                  )
                : const Center(child: CircularProgressIndicator(),),
          );
        },
        viewModelBuilder: () => locator<ApiScreenViewModel>());
  }
}
