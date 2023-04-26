// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_example_flutter/features/cart/presentation/providers.dart';
import 'package:e_commerce_example_flutter/features/cart/presentation/view/widgets/cart_items_widget.dart';
import 'package:e_commerce_example_flutter/features/cart/presentation/view/widgets/cart_summary_widget.dart';

import '../../../../paiment/presentation/view/style.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'cart',
          style: kTextHeaderAppBar,
        ).tr(),
        centerTitle: false,
        actions: state.maybeWhen(
            orElse: () => null,
            loaded: (cart) =>
                [CartItemsNumberIcon(itemsNumber: cart.itemsNumber)],
            added: (cart, _) =>
                [CartItemsNumberIcon(itemsNumber: cart.itemsNumber)],
            adding: (cart, _) => cart != null
                ? [CartItemsNumberIcon(itemsNumber: cart.itemsNumber)]
                : null,
            errorAdd: (__, cart, _) => cart != null
                ? [CartItemsNumberIcon(itemsNumber: cart.itemsNumber)]
                : null,
            removed: (cart) =>
                [CartItemsNumberIcon(itemsNumber: cart.itemsNumber)],
            removing: (cart, _) =>
                [CartItemsNumberIcon(itemsNumber: cart.itemsNumber)],
            errorRemove: (__, cart, _) =>
                [CartItemsNumberIcon(itemsNumber: cart.itemsNumber)]),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            CartSummaryWidget(),
            SizedBox(height: 20),
            Expanded(child: CartItemsWidget())
          ],
        ),
      ),
    );
  }
}

class CartItemsNumberIcon extends StatelessWidget {
  final int itemsNumber;
  const CartItemsNumberIcon({
    required this.itemsNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: null,
      icon: CircleAvatar(
          backgroundColor: CColors.orange,
          child: Text('$itemsNumber',
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
              ))),
    );
  }
}
