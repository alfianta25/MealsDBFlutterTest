import 'package:dartz/dartz.dart';
import 'package:mealstestapp/features/home/domain/entities/meal_categories.dart';

import '../../../../core/error/failures.dart';

abstract class MealsCategoryRepository {
  Future<Either<Failure, MealCategories>> getMealsCategory(String strCategory);
}
