import 'package:e_commerce_example_flutter/features/auth/presentation/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/pages/home/home_screen.dart';
import 'features/products/presentation/view/pages/tabbar.dart';
import 'initial_screen.dart';

class MAinScreen extends ConsumerStatefulWidget {
  const MAinScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MAinScreenState();
}

class _MAinScreenState extends ConsumerState<MAinScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(authProvider);
      return state.maybeWhen(
          unnauthenticated: () => HomeScreen(),
          initial: () => InitialScreen(
                message: "Welcome Dear ",
              ),
          orElse: () => InitialScreen(
                message: "something went wrong  ",
              ),
          loggingOut: () => HomeScreen(),
          loggedOut: () => HomeScreen(),
          loggedIn: (_) => FRTabbarScreen(),
          registered: (_) => FRTabbarScreen(),
          checked: (_) => FRTabbarScreen());
    });
  }
}
