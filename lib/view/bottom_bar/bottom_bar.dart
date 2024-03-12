import 'package:authentication/view/profile_page/profile.dart';
import 'package:authentication/view/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:authentication/controller/bottom_provider.dart';
import 'package:authentication/view/home_page/home_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    final providerdata = Provider.of<BottomProvider>(context);
    return Scaffold(
      body: _tabs[providerdata.currentindex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            duration: const Duration(milliseconds: 500),
            tabBackgroundColor: Colors.orange,
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_border_outlined,
                text: 'Fav...',
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Profile',
              ),
            ],
            selectedIndex: providerdata.currentindex,
            onTabChange: (index) {
              providerdata.change(index);
            },
          ),
        ),
      ),
    );
  }
}

final List<Widget> _tabs = [
  const HomePage(),
  const WishList(),
  // const Cart(),
  const Profile(),
];
