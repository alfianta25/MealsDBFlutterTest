import 'package:mealstestapp/features/home/domain/entities/number_trivia.dart';
import 'package:meta/meta.dart';

class MealsCategoryModel extends NumberTrivia {
  MealsCategoryModel({
    @required String strCategory,
  }) : super(strCategory: strCategory);

  factory MealsCategoryModel.fromJson(Map<String, dynamic> json) {
    return MealsCategoryModel(
      strCategory: json['strCategory'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strCategory': strCategory,
    };
  }
}
