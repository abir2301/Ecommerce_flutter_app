import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../cart/presentation/providers.dart';
import '../components/appbar.dart';
import '../components/paiment_method.dart';
import '../style.dart';

class PaymentPage extends ConsumerStatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cartProvider);
    return ListView(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.9,
          // color: const Color(0xFF030303),
          child: Column(
            children: [
              // App Bar
              const MyAppBar(
                headerText: "Payment",
                subHeaderText: "Convenient Payment",
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Card
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF303030),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Card Top Info
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text: 'Ower ',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: Color(0xFFFCC873),
                                          fontSize: 17,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w800,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Pay',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 10,
                                          backgroundColor: Color(0xFF4B4B4B),
                                        ),
                                        Transform.translate(
                                          offset: const Offset(-8, 0),
                                          child: const CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Color(0xFFFCC873),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),

                                // Card Owner Name
                                const SizedBox(height: 20),
                                const Text(
                                  'test user ',
                                  style: kSubTextHeaderAppBar,
                                ),

                                // Card Secure Number
                                const SizedBox(height: 20),
                                const Row(
                                  children: [
                                    Text(
                                      '****',
                                      style: kTextHeaderAppBar,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '****',
                                      style: kTextHeaderAppBar,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '****',
                                      style: kTextHeaderAppBar,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '3491',
                                      style: kTextHeaderAppBar,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),

                                // Card Bottom Info
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text: 'Inventory ',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.normal,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' \$103 440',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: const TextSpan(
                                        text: 'Cvv2 ',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.normal,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' 789',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Divider
                        const SizedBox(
                          height: 30,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: Divider(
                            color: Color(0xFF2F2F2F),
                            height: 1.4,
                            thickness: 1.7,
                          ),
                        ),

                        // Payment Method
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: 'Payment ',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.normal,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Method',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PaymentMethod(
                              iconPath: "assets/images/paypal logo.png",
                              isSelected: false,
                            ),
                            PaymentMethod(
                              iconPath: "assets/images/airtel logo.png",
                              isSelected: true,
                            ),
                            PaymentMethod(
                              iconPath: "assets/images/add logo.png",
                              isSelected: false,
                            ),
                          ],
                        ),

                        // Divider
                        const SizedBox(
                          height: 30,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: Divider(
                            color: Color(0xFF2F2F2F),
                            height: 1.4,
                            thickness: 1.7,
                          ),
                        ),

                        // Payment Number
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Number',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              state.maybeWhen(
                                  orElse: () => "",
                                  loaded: (cart) => cart.itemsNumber.toString(),
                                  added: (cart, _) =>
                                      cart.itemsNumber.toString(),
                                  adding: (cart, _) => cart != null
                                      ? cart.itemsNumber.toString()
                                      : "",
                                  errorAdd: (__, cart, _) => cart != null
                                      ? cart.itemsNumber.toString()
                                      : "",
                                  removed: (cart) =>
                                      cart.itemsNumber.toString(),
                                  removing: (cart, _) =>
                                      cart.itemsNumber.toString(),
                                  errorRemove: (__, cart, _) =>
                                      cart.itemsNumber.toString()),
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // Payment Total Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Price',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              state.maybeWhen(
                                  orElse: () => "",
                                  loaded: (cart) =>
                                      cart.total.value.toString() + " DT",
                                  added: (cart, _) =>
                                      cart.total.value.toString() + " DT",
                                  adding: (cart, _) => cart != null
                                      ? cart.total.value.toString() + " DT"
                                      : "",
                                  errorAdd: (__, cart, _) => cart != null
                                      ? cart.total.value.toString() + " DT"
                                      : "",
                                  removed: (cart) =>
                                      cart.total.value.toString() + " DT",
                                  removing: (cart, _) =>
                                      cart.total.value.toString() + " DT",
                                  errorRemove: (__, cart, _) =>
                                      cart.total.value.toString() + " DT"),
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 1,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFCC873),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Bottom button
                              const SizedBox(
                                height: 70,
                                width: 200,
                                child: Center(
                                  child: Text(
                                    'Confirmation',
                                    style: kTextButton,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 30),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.black87,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.black54,
                                      size: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //  Buttom Confirmation
            ],
          ),
        ),
      ],
    );
  }
}
