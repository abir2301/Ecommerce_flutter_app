import 'package:e_commerce_example_flutter/core/pages/home/components/product_card.dart';
import 'package:e_commerce_example_flutter/core/pages/home/hearder.dart';
import 'package:e_commerce_example_flutter/core/pages/home/search_field.dart';
import 'package:e_commerce_example_flutter/core/pages/home/special_offer.dart';
import 'package:e_commerce_example_flutter/core/pages/home/special_offers/special_offers_screen.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/view/pages/product_page.dart';
import 'package:flutter/material.dart';

import '../../../features/products/presentation/view/pages/products_page.dart';
import 'model/popular.dart';
import 'most_popular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final datas = homePopularProducts;

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.fromLTRB(24, 24, 24, 0);

    return Scaffold(
      body
      : CustomScrollView(
        slivers: <Widget>[
          // CustomAppBar(),
    
          const SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverAppBar(
              pinned: true,
              flexibleSpace: HomeAppBar(),
            ),
          ),
          // SliverPadding(
          //   padding: padding,
          //   sliver: SliverList(
          //     delegate: SliverChildBuilderDelegate(
          //       ((context, index) => MostPupularCategory()),
          //       childCount: 1,
          //     ),
          //   ),
          // ),
          SliverPadding(
            padding: padding,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                ((context, index) => SpecialOffers(
                    onTapSeeAll: () => _onTapSpecialOffersSeeAll(context))),
                childCount: 1,
              ),
            ),
          ),
          SliverPadding(
            padding: padding,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                ((context, index) => _buildBody(context)),
                childCount: 1,
              ),
            ),
          ),
          // SliverPadding(
          //   padding: padding,
          //   sliver: _buildPopulars(),
          // ),
          const SliverAppBar(flexibleSpace: SizedBox(height: 24))
        ],
      ),
    );
  }

  void _onTapSpecialOffersSeeAll(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SpecialOfferScreen()),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        ProductsPage()
        // const SearchField(),
        // const SizedBox(height: 24),
        // SpecialOffers(onTapSeeAll: () => _onTapSpecialOffersSeeAll(context)),
        // const SizedBox(height: 24),
        // // MostPopularTitle(onTapseeAll: () => _onTapMostPopularSeeAll(context)),
        // const SizedBox(height: 24),
        // const MostPupularCategory(),
        // ProductsPage()
      ],
    );
  }
}
