import 'package:equatable/equatable.dart';

abstract class MealsListEvent extends Equatable {
  const MealsListEvent();

  @override
  List<Object> get props => [];
}

class LoadListMeals extends MealsListEvent {}
