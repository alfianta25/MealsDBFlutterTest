import 'package:mealstestapp/features/home/domain/entities/meal_categories.dart';
import 'package:movie_bloc_retrofit/data/movies/remote/response/movies_item.dart';
import 'package:equatable/equatable.dart';

abstract class MealListState extends Equatable {
  const MealListState();

  @override
  List<Object> get props => [];
}

class InitialMealListState extends MealListState {}

class MealListLoading extends MealListState {}

class MealListHasData extends MealListState {
  final List<MealCategories> mealCategoriesList;

  const MealListHasData([this.mealCategoriesList]);

  @override
  List<Object> get props => [mealCategoriesList];
}

class MealistNoData extends MealListState {
  final String message;

  const MealistNoData(this.message);

  List<Object> get props => [message];

  @override
  String toString() => 'Movies No Data (message : $message)';
}

class MealListNoInternetConnection extends MealListState {
  final String message;

  const MealListNoInternetConnection(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'Movies No Internet(message : $message)';
}

class MealListError extends MealListState {
  final String errorMessage;

  const MealListError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'Movies Failure --> message: $errorMessage';
}
