

import 'package:food_delivary_app/models/food.dart';
import 'package:food_delivary_app/models/restaurant.dart';

class Order {
  final Restaurant restaurant;
  final Food food;
  final String date;
  final int quantity;

  Order({
   required this.date,
   required this.restaurant,
   required this.food,
   required this.quantity,
  });
}
