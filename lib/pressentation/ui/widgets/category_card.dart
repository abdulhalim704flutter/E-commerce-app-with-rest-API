import 'package:ecom_ostad/data/models/category_data.dart';
import 'package:ecom_ostad/data/models/category_model.dart';
import 'package:ecom_ostad/pressentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.categoryData,
  });

  final CategoryData categoryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding : EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)
            ),

            child: Image.network(
              categoryData.categoryImg ?? ''
            ),
          ),
          const SizedBox(height: 8,),
          Text(
            categoryData.categoryName ?? '',
            style: TextStyle(
              fontSize: 15,
              color: AppColors.primaryColor
          ),),
        ],
      ),
    );
  }
}
