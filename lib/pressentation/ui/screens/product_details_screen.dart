import 'package:ecom_ostad/data/models/product_details.dart';
import 'package:ecom_ostad/data/models/product_details.dart';
import 'package:ecom_ostad/data/models/product_details.dart';
import 'package:ecom_ostad/data/models/products.dart';
import 'package:ecom_ostad/pressentation/state_holder/product_details_controller.dart';
import 'package:ecom_ostad/pressentation/ui/utils/color_extensions.dart';
import 'package:ecom_ostad/pressentation/ui/widgets/coustom_steper.dart';
import 'package:ecom_ostad/pressentation/ui/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product_details.dart';
import '../../../data/models/product_details.dart';
import '../../../data/models/product_details.dart';
import '../../../data/models/product_details.dart';
import '../utils/app_colors.dart';
import '../widgets/sizes_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  
  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          if(productDetailsController.getProductDetailsInProgress){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ProductImageSlider(
                              imageList: [
                                productDetailsController.productDetails.img1 ?? '',
                                productDetailsController.productDetails.img2 ?? '',
                                productDetailsController.productDetails.img3 ?? '',
                                productDetailsController.productDetails.img4 ?? '',
                              ] ,
                            ),
                            ProductDetailsAppBar,
                          ],
                        ),
                        productDetails(
                          productDetailsController.productDetails,
                          productDetailsController.availableColors
                        ),
                      ],
                    ),
                  ),
                ),
                CarttoCartBottomContainer,
              ],
            ),
          );
        }
      ),
    );
  }

  Padding productDetails (ProductDetails productDetails,List<String> colors){
    return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  productDetails.product!.title ?? '',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )),
                            CustomSteper(
                                lowerLimit: 1,
                                upperLimit: 10,
                                stepValue: 1,
                                value: 1,
                                onChange: (newValue) {
                                  print(newValue);
                                })
                          ],
                        ),
                        Row(
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.amber,
                                ),
                                Text(
                                  '${productDetails.product!.star ?? 0}',
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueGrey),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Review',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor),
                              ),
                            ),
                            Card(
                              color: AppColors.primaryColor,
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(
                          'Color',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 25,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: colors.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  _selectedColorIndex = index;
                                  if (mounted) {
                                    setState(() {});
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: HexColor.fromHex(colors[index]),
                                  child: _selectedColorIndex == index
                                      ? const Icon(
                                          Icons.done,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                width: 8,
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Size',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 25,
                          child: SizePicker(
                            initialSelected: 0,
                            onSelected: (int selectedSize){
                              _selectedSizeIndex = selectedSize;
                            },
                            sizes: productDetails.size?.split(',') ?? [],),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          productDetails.des ?? '',
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  );
  }

  AppBar get ProductDetailsAppBar {
    return AppBar(
      leading: BackButton(
        color: Colors.black54,
      ),
      title: Text(
        'Product Details',
        style: TextStyle(color: Colors.black54),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Container get CarttoCartBottomContainer {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                '\$120',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
              width: 120,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Add to cart')))
        ],
      ),
    );
  }
}


