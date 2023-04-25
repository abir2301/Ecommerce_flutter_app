import 'package:e_commerce_example_flutter/core/pages/home/components/app_bar.dart';
import 'package:e_commerce_example_flutter/core/pages/home/components/product_card.dart';
import 'package:flutter/material.dart';

import '../model/popular.dart';

class MostPopularScreen extends StatefulWidget {
  const MostPopularScreen({super.key});

  @override
  State<MostPopularScreen> createState() => _MostPopularScreenState();
}

class _MostPopularScreenState extends State<MostPopularScreen> {
  late final datas = homePopularProducts;

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.fromLTRB(24, 50, 24, 0);
    return Scaffold(
      //appBar: AppBar(),
      // FRAppBar.defaultAppBar(
      //   context,
      //   title: 'Most Popular',
      //   actions: [
      //     IconButton(
      //       icon: Image.asset('assets/icons/search@2x.png', scale: 2.0),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: CustomScrollView(slivers: [
        SliverPadding(
          padding: padding,
          sliver: _buildPopulars(),
        ),
        const SliverAppBar(flexibleSpace: SizedBox(height: 24))
      ]),
    );
  }

  Widget _buildPopulars() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 185,
        mainAxisSpacing: 24,
        crossAxisSpacing: 16,
        mainAxisExtent: 285,
      ),
      delegate: SliverChildBuilderDelegate(_buildPopularItem, childCount: 30),
    );
  }

  Widget _buildPopularItem(BuildContext context, int index) {
    final data = datas[index % datas.length];
    return ProductCard(
      data: data,
    );
  }
}
