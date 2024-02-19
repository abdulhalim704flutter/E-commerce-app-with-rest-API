import 'package:ecom_ostad/pressentation/state_holder/category_controller.dart';
import 'package:ecom_ostad/pressentation/state_holder/main_bottom_nav_controller.dart';
import 'package:ecom_ostad/pressentation/state_holder/new_product_controller.dart';
import 'package:ecom_ostad/pressentation/state_holder/popular_product_controller.dart';
import 'package:ecom_ostad/pressentation/state_holder/speacial_product_controller.dart';
import 'package:ecom_ostad/pressentation/ui/screens/cart_screen.dart';
import 'package:ecom_ostad/pressentation/ui/screens/categories_list_screen.dart';
import 'package:ecom_ostad/pressentation/ui/screens/home_screen.dart';
import 'package:ecom_ostad/pressentation/ui/screens/wish_list_screen.dart';
import 'package:ecom_ostad/pressentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holder/home_slider_controller.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  MainBottomNavController mainBottomNavController = Get.put(MainBottomNavController());
  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesListScreen(),
    const CartScreen(),
    const WishListScreen(),

  ];

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeSliderController>().getHomeSlider();
      Get.find<CategoryController>().getCategories();
      Get.find<PopularProductController>().getPopularProducts();
      Get.find<NewProductController>().getNewProducts();
      Get.find<SpecialProductController>().getSpecialProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screens[controller.currentSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentSelectedIndex,
            onTap: controller.changeScreen,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            elevation: 4,
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              const BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'Categorise'),
              const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
              const BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Wishlist'),
            ],
          ),
        );
      }
    );
  }
}
