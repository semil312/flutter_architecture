// To parse this JSON data, do
//
//     final fundingModel = fundingModelFromJson(jsonString);

import 'dart:convert';

FundingModel fundingModelFromJson(String str) =>
    FundingModel.fromJson(json.decode(str));

String fundingModelToJson(FundingModel data) => json.encode(data.toJson());

class FundingModel {
  FundingModel({
    required this.goal,
    required this.raised,
  });

  int goal;
  int raised;

  factory FundingModel.fromJson(Map<String, dynamic> json) => FundingModel(
        goal: json["goal"],
        raised: json["raised"],
      );

  Map<String, dynamic> toJson() => {
        "goal": goal,
        "raised": raised,
      };
}
