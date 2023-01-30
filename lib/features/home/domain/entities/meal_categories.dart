import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MealCategories extends Equatable {
  final String strCategories;

  MealCategories({@required this.strCategories});

  @override
  // TODO: implement props
  List<Object?> get props => [strCategories];
}
