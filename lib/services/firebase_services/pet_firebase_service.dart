import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_architecture/model/pet_model.dart';

class PetFirebaseService {
  final CollectionReference petCollectionRefrence =
      FirebaseFirestore.instance.collection('adoption_pet');

  final CollectionReference lostPetCollectionRefrence =
      FirebaseFirestore.instance.collection('lost_pet');

  Future<List<PetModel>> getPets(String categoryName) async {
    QuerySnapshot records = await petCollectionRefrence
        .where("category", isEqualTo: categoryName)
        .orderBy('createdBy.timestamp', descending: true)
        .get();

    List<PetModel> petList = [];

    try {
      petList = records.docs
          .map(
            (pet) => PetModel(
              name: pet['name'],
              gender: pet['gender'],
              age: pet['age'],
              status: pet['status'],
              type: pet['type'],
              images: List<Images>.from(
                  pet["images"].map((x) => Images.fromJson(x))),
              thumbnail: List<Thumbnail>.from(
                  pet["thumbnail"].map((x) => Thumbnail.fromJson(x))),
              category: pet['category'],
              about: pet["about"] ?? "",
              detail: List<String>.from(pet["detail"].map((x) => x)),
            ),
          )
          .toList();
    } catch (e) {
      throw Exception("Error ${e.toString()}");
    }

    // log("Pet List :${petList.toString()}");

    return petList;
  }
}
