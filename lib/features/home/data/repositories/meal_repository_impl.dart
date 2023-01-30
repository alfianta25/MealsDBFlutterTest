import 'dart:async';

import 'package:mealstestapp/features/home/data/datasources/meals_remote_datasource.dart';
import 'package:mealstestapp/features/home/data/models/meals_list_model.dart';

class Repository {
  final mealsApiProvider = MealsApiProvider();

  Future<MealsResult> fetchAllMeals(String mealsType) =>
      mealsApiProvider.fetchMealsList(mealsType);

  Future<MealsResult> fetchDetailMeals(String mealsId) =>
      mealsApiProvider.fetchDetailMeals(mealsId);
}
