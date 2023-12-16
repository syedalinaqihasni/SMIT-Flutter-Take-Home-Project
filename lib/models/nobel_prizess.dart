import 'package:takehomeproject/models/laureates.dart';

class NobelPrize {
  String? awardYear;
  String? category;
  String? categoryFullName;
  String? dateAwarded;
  int? prizeAmount;
  int? prizeAmountAdjusted;
  List<Laureates>? laureates;

  NobelPrize({
    this.awardYear,
    this.category,
    this.categoryFullName,
    this.dateAwarded,
    this.laureates,
    this.prizeAmount,
    this.prizeAmountAdjusted,
  });

  factory NobelPrize.fromJson(Map<String, dynamic> json) {
    return NobelPrize(
      awardYear: json['awardYear'],
      category: json['category'],
      categoryFullName: json['categoryFullName'],
      dateAwarded: json['dateAwarded'],
      prizeAmount: json['prizeAmount'],
      prizeAmountAdjusted: json['prizeAmountAdjusted'],
      laureates: json['laureates']
          .cast<Map<String, dynamic>>()
          .map((e) => Laureates.fromJson(e))
          .toList()
          .cast<Laureates>(),
    );
  }
}
