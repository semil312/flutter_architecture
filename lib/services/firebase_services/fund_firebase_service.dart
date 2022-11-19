import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_architecture/model/funding_model.dart';

class FundFirebaseService {
  final CollectionReference fundCollectionRefrence =
  FirebaseFirestore.instance.collection('funding');

  Future<List<FundingModel>>? getFunds() async {
    QuerySnapshot funds = await fundCollectionRefrence.get();

    List<FundingModel>? fundList = [];

    fundList = funds.docs
        .map(
          (fund) => FundingModel(
        goal: fund['goal'],
        raised: fund['raised'],
      ),
    )
        .toList();

    return fundList;
  }
}
