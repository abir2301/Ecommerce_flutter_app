import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/auth/presentation/providers.dart';
import '../../../features/products/presentation/view/pages/products_page.dart';
import '../profile/profile_screen.dart';

class UserIcon extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);
    return state.maybeWhen(
      orElse: () => PopupMenuButton<int>(
          child: const Icon(
            Icons.more_vert_rounded,
            size: 31,
          ),
          onSelected: (value) {
            switch (value) {
              case 0:
                Navigator.of(context).pushNamed('login');
                break;
              case 1:
                Navigator.of(context).pushNamed('register');
                break;
              case 2:
                Navigator.of(context).pushNamed('settings');
                break;
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: const Text('login').tr(),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: const Text('register').tr(),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: const Text('settings').tr(),
              )
            ];
          }),
      loggedIn: (_) => const CartIcon(),
      checked: (_) => const CartIcon(),
      registered: (_) => const CartIcon(),
    );
  }
}

class HomeAppBar extends ConsumerWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String kIconPath = 'assets/icons';
    final state = ref.watch(authProvider);
    return 
    
    Container(
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      " mmd ${state.whenOrNull(unnauthenticated: () => "client", checked: (user) => user.name, loggedIn: (user) => user.name,
                          // ProfileIcon(userFirstCharacter: user.name[0]),
                          registered: (user) => user.name
                          // ProfileIcon(userFirstCharacter: ),
                          ) as String}",
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
              onPressed: () {},
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
  
  
  
  }
}
