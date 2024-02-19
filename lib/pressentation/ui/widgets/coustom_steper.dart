import 'package:ecom_ostad/pressentation/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSteper extends StatefulWidget {
  CustomSteper(
      {super.key,
      required this.lowerLimit,
      required this.upperLimit,
      required this.stepValue,
      required this.value,
      required this.onChange});

  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  int value;
  final Function(int) onChange;

  @override
  State<CustomSteper> createState() => _CustomSteperState();
}

class _CustomSteperState extends State<CustomSteper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.6),
        ),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Icon(
              Icons.remove,
              color: Colors.grey,
            ),
            onTap: () {
              widget.value = widget.value == widget.lowerLimit
                  ? widget.lowerLimit
                  : widget.value -= widget.stepValue;
              widget.onChange(widget.stepValue);
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              '${widget.value}',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            child: Icon(
              Icons.add,
              color: Colors.grey,
            ),
            onTap: () {
              widget.value = widget.value == widget.upperLimit
                  ? widget.upperLimit
                  : widget.value += widget.stepValue;
              widget.onChange(widget.stepValue);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
