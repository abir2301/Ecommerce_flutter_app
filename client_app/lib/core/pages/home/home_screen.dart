import 'package:e_commerce_example_flutter/core/pages/home/components/product_card.dart';
import 'package:e_commerce_example_flutter/core/pages/home/hearder.dart';
import 'package:e_commerce_example_flutter/core/pages/home/search_field.dart';
import 'package:e_commerce_example_flutter/core/pages/home/special_offer.dart';
import 'package:e_commerce_example_flutter/core/pages/home/special_offers/special_offers_screen.dart';
import 'package:e_commerce_example_flutter/features/auth/presentation/states/auth_state.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/view/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/auth/presentation/providers.dart';
import '../../../features/products/presentation/view/pages/products_page.dart';
import '../../utils/functions/display_snackbar.dart';
import '../chat/messages.dart';
import '../profile/profile_screen.dart';
import 'model/popular.dart';
import 'most_popular.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final datas = homePopularProducts;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);
    const String kIconPath = 'assets/icons';

    Widget homeAppBar = Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              ),
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/icons/me.png"),
                radius: 24,
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Salem 👋',
                      style: TextStyle(
                        color: Color(0xFF757575),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "client",
                      // " mmd ${state.whenOrNull(unnauthenticated: () => "client", checked: (user) => user.name, loggedIn: (user) => user.name,
                      //     // ProfileIcon(userFirstCharacter: user.name[0]),
                      //     registered: (user) => user.name
                      //     // ProfileIcon(userFirstCharacter: ),
                      //     ) as String}",
                      style: TextStyle(
                        color: Color(0xFF212121),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              iconSize: 28,
              icon: Image.asset('assets/icons/notification.png'),
              onPressed: () {
                print("hello not");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Messages()),
                );
              },
            ),
            const SizedBox(width: 16),
            IconButton(
              iconSize: 28,
              icon: Image.asset('$kIconPath/light/heart@2x.png'),
              onPressed: () {},
            ),
            UserIcon(),
          ],
        ),
      ),
    );

    const padding = EdgeInsets.fromLTRB(24, 24, 24, 0);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // CustomAppBar(),

          SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverAppBar(
              pinned: true,
              flexibleSpace: homeAppBar,
            ),
          ),

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
      children: [ProductsPage()],
    );
  }
}
