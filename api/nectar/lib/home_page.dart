import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/home/account_page.dart';
import 'package:nectar/home/cart_page.dart';
import 'package:nectar/home/explore_page.dart';
import 'package:nectar/home/favroite_page.dart';
import 'package:nectar/home/shop_page.dart';
import 'exit_popup.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
// ignore: non_constant_identifier_names

class _HomePageState extends State<HomePage> {
  int _seletedIndex = 0;
  final List<Widget> _widgets = [
    const ShopPage(),
    const ExplorePage(),
    const CartPage(),
    const FavoritePage(),
    const AccountPage()
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _widgets[_seletedIndex],
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              color: Colors.transparent),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.green,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            currentIndex: _seletedIndex,
            onTap: (index) {
              setState(() {
                _seletedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/shop_icon.svg'),
                label: 'Shop',
                activeIcon: SvgPicture.asset(
                  'assets/icons/shop_icon.svg',
                  color: Colors.green,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/explore_icon.svg'),
                label: 'Explore',
                activeIcon: SvgPicture.asset(
                  'assets/icons/explore_icon.svg',
                  color: Colors.green,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/cart_icon.svg'),
                label: 'Cart',
                activeIcon: SvgPicture.asset(
                  'assets/icons/cart_icon.svg',
                  color: Colors.green,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/favourite_icon.svg'),
                label: 'Favorite',
                activeIcon: SvgPicture.asset(
                  'assets/icons/favourite_icon.svg',
                  color: Colors.green,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/account_icon.svg'),
                label: 'Account',
                activeIcon: SvgPicture.asset(
                  'assets/icons/account_icon.svg',
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
