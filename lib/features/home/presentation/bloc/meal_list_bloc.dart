import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealstestapp/features/home/data/datasources/meals_remote_datasource.dart';
import 'package:mealstestapp/features/home/presentation/bloc/meal_list_event.dart';
import 'package:mealstestapp/features/home/presentation/bloc/meal_list_state.dart';

class MealListBloc extends Bloc<MealsListEvent, MealListState> {
  final MealsRemoteDataSource repository;

  MealListBloc({@required this.repository}) : super(InitialMealListState());

  @override
  Stream<MealListState> mapEventToState(MealsListEvent event) async* {
    if (event is LoadListMeals) {
      yield* _mapLoadMealListToState();
    }
  }

  Stream<MealListState> _mapLoadMealListToState() async* {
    try {
      yield MealListLoading();
      var meals = await repository.getMealList();
      if (meals?.results?.isEmpty ?? true) {
        yield MealistNoData("Movies Not Found");
      } else {
        yield MealListHasData(meals.results);
      }
    } catch (e) {
      yield MealListError(e.toString());
    }
  }
}
