import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SizePicker extends StatefulWidget {
  SizePicker({super.key, required this. sizes, required this.onSelected, required this.initialSelected});

  final List<String> sizes;
  final Function(int selectedIndex) onSelected;
  final int initialSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  int _selectedSizeIndex = 0;
  @override
  void initState() {
    super.initState();
    _selectedSizeIndex = widget.initialSelected;
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.sizes.length,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            _selectedSizeIndex = index;
            widget.onSelected(index);
            if (mounted) {
              setState(() {});
            }
          },
          child: Container(
            padding:
            EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
                color: _selectedSizeIndex == index
                    ? AppColors.primaryColor
                    : null),
            alignment: Alignment.center,
            child: Text(
              '${widget.sizes[index]}',
              style: TextStyle(
                  color: _selectedSizeIndex == index
                      ? Colors.white
                      : null),
            ),
          ),
        );
      },
      separatorBuilder:
          (BuildContext context, int index) {
        return SizedBox(
          width: 8,
        );
      },
    );
  }
}