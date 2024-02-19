import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'coustom_steper.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/images/shoe.png'),
                )
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Addidas Shoe for man',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              const SizedBox(height: 8,),
                              RichText(
                                text: TextSpan(
                                    style:
                                    TextStyle(color: Colors.black54),
                                    children: [
                                      TextSpan(text: 'Color: Black '),
                                      TextSpan(text: 'Size: XL'),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.delete))
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$100',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        CustomSteper(
                            lowerLimit: 1,
                            upperLimit: 12,
                            stepValue: 1,
                            value: 1,
                            onChange: (int value) {})
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
