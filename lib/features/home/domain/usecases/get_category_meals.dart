import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mealstestapp/features/home/domain/entities/meal_categories.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/meal_category_repository.dart';

class GetMealsList implements UseCase<MealCategories, Params> {
  final MealsCategoryRepository repository;

  GetMealsList(this.repository);

  @override
  Future<Either<Failure, MealCategories>> call(Params strCategory) async {
    return await repository.getMealsCategory(strCategory);
  }
}

class Params extends Equatable {
  final int strCategory;

  Params({@required this.strCategory});

  @override
  List<Object> get props => [strCategory];
}
