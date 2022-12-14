import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/models/order.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    currentUser.cart.forEach(
        (Order order) => totalPrice += order.quantity * order.food.price);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart(${currentUser.cart.length})',
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            if (index < currentUser.cart.length) {
              Order order = currentUser.cart[index];
              return _buildCartItem(order);
            }
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: (Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Estimated Delivery Time: ',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600)),
                      Text('25 min',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Cost: ',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600)),
                      Text('\$${totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.green[700]))
                    ],
                  ),
                  const SizedBox(height: 80.0,)
                ],

              )),

            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 0.5,
              thickness: 1.5,
              indent: 20,
              endIndent: 20,
              color: Colors.grey,
            );
          },
          itemCount: currentUser.cart.length + 1),
      bottomSheet: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0, -1),
                  blurRadius: 6.0),
            ]),
        child: Center(
          child: TextButton(
              onPressed: () => {},
              child: const Text(
                'CHECKOUT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.0

                ),
              )),
        ),
      ),
    );
  }

  Widget _buildCartItem(Order order) {
    return Container(
      height: 170.0,
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(order.food.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.food.name,
                          style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          order.restaurant.name,
                          style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border:
                                Border.all(width: 0.8, color: Colors.black54),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: Text('-',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 25))),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Text(order.quantity.toString(),
                                  style: const TextStyle(fontSize: 18)),
                              const SizedBox(width: 20.0),
                              GestureDetector(
                                  onTap: () {},
                                  child: Text('+',
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 20))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(10.0),
              child: Text(
                '\$${order.quantity * order.food.price}',
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w600),
              )),
        ],
      ),
    );
  }
}
