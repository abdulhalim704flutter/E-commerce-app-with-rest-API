import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  const SectionHeader({
    super.key, required this.title, required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.titleLarge,),
        TextButton(onPressed: ontap, child: const Text('See all'))
      ],
    );
  }
}
