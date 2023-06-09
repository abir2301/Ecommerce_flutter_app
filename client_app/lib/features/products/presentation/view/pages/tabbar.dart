import 'package:e_commerce_example_flutter/core/pages/settings_page.dart';
import 'package:e_commerce_example_flutter/features/auth/presentation/states/auth_state.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/view/pages/products_page.dart';
import 'package:e_commerce_example_flutter/features/products/presentation/view/pages/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_example_flutter/features/cart/presentation/view/pages/cart_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/pages/home/home_screen.dart';
import '../../../../../core/pages/profile/profile_screen.dart';
import '../../../../../image_loader.dart';
import '../../../../../size_config.dart';
import '../../../../auth/presentation/providers.dart';
import '../../../../paiment/presentation/view/pages/paiment_screen.dart';
// import 'package:fresh_store_ui/image_loader.dart';
// import 'package:fresh_store_ui/screens/home/home.dart';
// import 'package:fresh_store_ui/screens/profile/profile_screen.dart';
// import 'package:fresh_store_ui/screens/test/test_screen.dart';
// import 'package:fresh_store_ui/size_config.dart';

class TabbarItem {
  final String lightIcon;
  final String boldIcon;
  final String label;

  TabbarItem(
      {required this.lightIcon, required this.boldIcon, required this.label});

  BottomNavigationBarItem item(bool isbold) {
    return BottomNavigationBarItem(
      icon: ImageLoader.imageAsset(isbold ? boldIcon : lightIcon),
      label: label,
    );
  }

  BottomNavigationBarItem get light => item(false);
  BottomNavigationBarItem get bold => item(true);
}

class FRTabbarScreen extends ConsumerStatefulWidget {
  const FRTabbarScreen({super.key});

  @override
  ConsumerState<FRTabbarScreen> createState() => _FRTabbarScreenState();
}

class _FRTabbarScreenState extends ConsumerState<FRTabbarScreen> {
  int _select = 0;

  final screens = [
    //ProductsPage(),
    HomeScreen(),
    const CartPage(),
    const TestScreen(title: 'Orders'),
    // const ProfileScreen(),
    // const TestScreen(title: 'wallet screen '),
    PaymentPage(),
    const SettingsPage()
  ];

  static Image generateIcon(String path) {
    return Image.asset(
      '${ImageLoader.rootPaht}/tabbar/$path',
      width: 24,
      height: 24,
    );
  }

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: generateIcon("light/Home@2x.png"),
      activeIcon: generateIcon('bold/Home@2x.png'),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: generateIcon('light/Bag@2x.png'),
      activeIcon: generateIcon('bold/Bag@2x.png'),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: generateIcon('light/Buy@2x.png'),
      activeIcon: generateIcon('bold/Buy@2x.png'),
      label: 'Orders',
    ),
    BottomNavigationBarItem(
      icon: generateIcon('light/Wallet@2x.png'),
      activeIcon: generateIcon('bold/Wallet@2x.png'),
      label: 'Wallet',
    ),
    BottomNavigationBarItem(
      icon: generateIcon('light/Profile@2x.png'),
      activeIcon: generateIcon('bold/Profile@2x.png'),
      label: 'Profile',
    ),
  ];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);
    SizeConfig().init(context);

    return Scaffold(
      body: screens[_select],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        onTap: ((value) => setState(() => _select = value)),
        currentIndex: _select,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 10,
        ),
        selectedItemColor: const Color(0xFF212121),
        unselectedItemColor: const Color(0xFF9E9E9E),
      ),
    );
  }
}
