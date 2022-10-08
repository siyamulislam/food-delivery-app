import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/models/order.dart';

class RecentOrder extends StatelessWidget {
  const RecentOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          child: Text(
            "Recent Orders",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500, letterSpacing: 1.2),
          ),
        ),
        Container(
            height: 120.0,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 3.0),
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders.length,
              itemBuilder: (context, index) {
                Order order = currentUser.orders[index];
                return (_buildRecentOrder(context, order));
              },
            ))
      ],
    );
  }

  _buildRecentOrder(BuildContext context, Order order) {
    return SizedBox(
      child: Container(
          width: 320,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1, color: Colors.grey.shade200)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  order.food.imageUrl,
                  height: 100,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 140,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        order.food.name,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(order.restaurant.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(order.date,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                alignment: Alignment.center,
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: RawMaterialButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
