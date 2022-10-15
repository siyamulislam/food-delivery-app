import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/screens/cart_screen.dart';
import 'package:food_delivery_app/widgets/nearby_restaurant.dart';
import 'package:food_delivery_app/widgets/recent_order.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => {}, icon: const Icon(Icons.account_circle)),
        title: const Text("Food Delivery"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const CartScreen()));
            },
            child: Text(
              'Cart(${currentUser.cart.length})',
              style: const TextStyle(fontSize: 20),
            ),
          )
        ],
        centerTitle: true,
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //     // statusBarColor: Color.fromRGBO(236, 80, 30, 1.0),
        //     statusBarBrightness: Brightness.light),
      ),
      body: ListView(
        // physics: BouncingScrollPhysics(),
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(300.0),
                  ),
                  // enabledBorder: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(30.0),
                  //     borderSide: const BorderSide(width: 0.8,)),
                  prefixIcon: const Icon(Icons.search, size: 30.0),
                  hintText: "Search Food or Restaurants",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear, size: 30.0),
                    onPressed: () {},
                  )),
            ),
          ),
          RecentOrder(),
          NearbyRestaurant(),
        ],
      ),
    );
  }
}
