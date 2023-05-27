import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key, this.title = ''});

  static String route() => '/test';

  final String title;

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    String? selectedMethod = "Standard Shipping";
    List<String> shippingMethods = [
      'Standard Shipping',
      'Express Shipping',
      'Next-day Delivery',
    ];
    final List<Order> orders = [
      Order(
          itemName: 'Order A',
          price: 150.5,
          isShippingDone: true,
          date: "12/05/2023"),
      Order(
          itemName: 'Order C',
          price: 70.5,
          isShippingDone: true,
          date: "12/05/2023"),
      Order(
          itemName: 'Order B',
          price: 200,
          isShippingDone: false,
          date: "26/05/2023"),
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          "Modify Shipping Way",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.pink, fontSize: 17),
        ),
        Container(
          height: 100,
          padding: EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              value: selectedMethod,
              items: shippingMethods.map((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Container(
                    child: Text(
                      method,
                      style: const TextStyle(
                        color: Colors
                            .blue, // Example: Blue color for selected item
                        fontWeight: FontWeight
                            .bold, // Example: Bold font weight for selected item
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMethod = value;
                });
              },
              // decoration: InputDecoration(
              //   labelText: 'Shipping Method',
              //   border: OutlineInputBorder(),
              // ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(orders[index].itemName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(orders[index].price.toStringAsFixed(2)),
                        Text(
                          orders[index].date,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CColors.orange),
                        )
                      ],
                    ),
                    trailing: orders[index].isShippingDone
                        ? Icon(Icons.check_circle, color: Colors.green)
                        : Icon(Icons.pending, color: Colors.orange),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class Order {
  final String itemName;
  final double price;
  final bool isShippingDone;
  final String date;

  Order(
      {required this.itemName,
      required this.price,
      required this.date,
      required this.isShippingDone});
}
