import 'package:ecom_ostad/pressentation/state_holder/category_controller.dart';
import 'package:ecom_ostad/pressentation/state_holder/home_slider_controller.dart';
import 'package:ecom_ostad/pressentation/state_holder/main_bottom_nav_controller.dart';
import 'package:ecom_ostad/pressentation/state_holder/new_product_controller.dart';
import 'package:ecom_ostad/pressentation/state_holder/popular_product_controller.dart';
import 'package:ecom_ostad/pressentation/state_holder/speacial_product_controller.dart';
import 'package:ecom_ostad/pressentation/ui/screens/product_list_screen.dart';
import 'package:ecom_ostad/pressentation/ui/utils/images_assets.dart';
import 'package:ecom_ostad/pressentation/ui/widgets/category_card.dart';
import 'package:ecom_ostad/pressentation/ui/widgets/circular_icon_button.dart';
import 'package:ecom_ostad/pressentation/ui/widgets/home/home_slider.dart';
import 'package:ecom_ostad/pressentation/ui/widgets/home/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(ImageAssets.craftyBayNavLogoSvg),
            const Spacer(),
            CircularIcons(
              icon: Icons.person,
              ontap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIcons(
              icon: Icons.call,
              ontap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIcons(
              icon: Icons.notifications_active,
              ontap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  filled: true,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              GetBuilder<HomeSliderController>(builder: (homeSliderController) {
                if (homeSliderController.getHomeSliderInProgress) {
                  return const SizedBox(
                    height: 180,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return HomeSlider(
                  sliders: homeSliderController.sliderModel.data ?? [],
                );
              }),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'Categorise',
                ontap: () {
                  Get.find<MainBottomNavController>().changeScreen(1);
                },
              ),
              SizedBox(
                height: 120,
                child: GetBuilder<CategoryController>(
                    builder: (categoryController) {
                  if (categoryController.getCategoriesInProgress) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: categoryController.categoryModel.data!.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryCard(categoryData: categoryController.categoryModel.data![index],);
                    },
                  );
                }),
              ),
              SectionHeader(
                title: 'Popular',
                ontap: () {
                  Get.to(ProductListScreen());
                },
              ),
              SizedBox(
                height: 180,
                 child: GetBuilder<PopularProductController>(
                   builder: (productController) {
                     if(productController.getPopularProductInProgress){
                       return Center(
                         child: CircularProgressIndicator(),
                       );
                     }
                     return ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemCount: productController.popularProductModel.data?.length ?? 0,
                         itemBuilder: (context, index) {
                           return ProductCard(
                             product: productController.popularProductModel.data![index],
                           );
                         });
                  }
                 ),
              ),
              SectionHeader(
                title: 'Special',
                ontap: () {},
              ),
              SizedBox(
                height: 180,
                 child: GetBuilder<SpecialProductController>(
                   builder: (specialProductController) {
                     if(specialProductController.getSpecialProductInProgress){
                       return const Center(
                         child: CircularProgressIndicator(),
                       );
                     }
                     return ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemCount: getLength(specialProductController.specialProductModel.data!.length ?? 0),
                         itemBuilder: (context, index) {
                           return ProductCard(
                             product: specialProductController.specialProductModel.data![index],
                           );
                         }
                         );
                   }
                 ),
              ),
              SectionHeader(
                title: 'New',
                ontap: () {},
              ),
              SizedBox(
                height: 180,
                 child: GetBuilder<NewProductController>(
                   builder: (newProductController) {
                     if(newProductController.getNewProductInProgress){
                       return Center(
                         child: CircularProgressIndicator(),
                       );
                     }
                     return ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemCount: newProductController.newProductModel.data?.length ?? 0,
                         itemBuilder: (context, index) {
                           return ProductCard(
                             product: newProductController.newProductModel.data![index],

                           );
                         });
                   }
                 ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int getLength(int length){
    return length > 4 ? 2 : length;
  }
}
