import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/locator.dart';
import 'package:flutter_architecture/base/app_setup.router.dart';
import 'package:flutter_architecture/model/adoption_category_model.dart';
import 'package:flutter_architecture/model/pet_model.dart';
import 'package:flutter_architecture/services/firebase_services/pet_firebase_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeScreenViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  PetFirebaseService petFirebaseService = PetFirebaseService();

  Future<List<PetModel>>? future;

  bool elevationToTab = false;

  ScrollController controllerS = ScrollController();

  jumpTo() {
    double a = controllerS.position.pixels;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controllerS.jumpTo(a);
      notifyListeners();
    });
  }

  giveElevationToTab(bool ready) {
    if (elevationToTab != ready) {
      elevationToTab = ready;
      notifyListeners();
    }
  }

  String selectedCategory = "Dog";

  changeCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }

  List<AdoptionCategoryModel> listOfCategory = [
    AdoptionCategoryModel(name: "Dog", image: "icons/dog.svg"),
    AdoptionCategoryModel(name: "Cat", image: "icons/cat.svg"),
    AdoptionCategoryModel(name: "Other", image: "icons/Frog.svg"),
  ];

  init() {
    future = PetFirebaseService().getPets(selectedCategory);
    notifyListeners();
  }

  selectCategory(String category) async {
    selectedCategory = category;
    notifyListeners();
    future = petFirebaseService.getPets(selectedCategory);
    notifyListeners();
  }

  void navigate() {
    _navigationService.navigateTo(
      Routes.aboutCatScreen,
      arguments: AboutCatScreenArguments(),
    );
  }
}
