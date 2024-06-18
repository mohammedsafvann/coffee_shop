import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:coffee/views/screens/home_screen.dart';
import 'package:coffee/views/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/constants.dart';
import '../screens/my_order_screen.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  List<Widget> pages = [HomeScreen(), CartScreen(), MyOrderScreen()];
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          currentIndex: currentIndex,
          selectedFontSize: 12,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/home icon.svg",
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/shopping-bag.svg",
                height: 25,
              ),
              label: "My Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined,
                  color: Constants.kitGradients[0]),
              // activeColor: Colors.white,
              // inactiveColor: Colors.white60,
              label: "My Order",
            ),
          ],
        ),
      ),
    );
  }
}
