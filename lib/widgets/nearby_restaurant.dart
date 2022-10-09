import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/models/order.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/screens/restaurant_screen.dart';
import 'package:food_delivery_app/widgets/rating_starts.dart';

class NearbyRestaurant extends StatelessWidget {
  const NearbyRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text(
            "Nearby Restaurants",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, letterSpacing: 1.2),
          ),
        ),
        _buildRestaurant(context),
      ],
    );
  }

  _buildRestaurant(BuildContext context) {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>
            RestaurantScreen(restaurant:restaurant))),
        child: Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1, color: Colors.grey.shade200)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Hero(
                  tag: restaurant.imageUrl,
                  child: Image(
                    image: AssetImage( restaurant.imageUrl),
                    height: 120,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      RatingStars(restaurant.rating,25.0),
                      Text(restaurant.address,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400)),
                      const SizedBox(height: 4.0),
                      const Text("200m away",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    });
    return Column(
      children: restaurantList,
    );
  }

}
