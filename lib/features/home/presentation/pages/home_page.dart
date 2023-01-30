import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealstestapp/features/home/data/datasources/meals_key.dart';
import 'package:mealstestapp/features/home/data/models/meals_list_model.dart';
import 'package:mealstestapp/features/home/presentation/widgets/custom_card_list.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            config.appDisplayName,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: getListMeals());
  }

  getListMeals() {
    return Container(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Center(
        child: StreamBuilder(
          // stream: bloc.allMeals,
          builder: (context, AsyncSnapshot<MealsResult> snapshot) {
            if (snapshot.hasData) {
              return _showListDessert(snapshot.data!.meals);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
          },
        ),
      ),
    );
  }

  Widget _showListDessert(List<Meals> meals) => GridView.builder(
        key: Key(KEY_GRID_VIEW_DESSERT),
        itemCount: meals == null ? 0 : meals.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: CustomCardList(
            meals: meals[index],
            type: 'dessert',
          ));
        },
      );

  // void onTabTapped(int index) {
  //   setState(() {
  //     _page = index;
  //   });
  // }
}

void showToast(BuildContext context, String mealsName,
    {int duration, int gravity}) {
  Toast.show(mealsName, context, duration: duration, gravity: gravity);
}
