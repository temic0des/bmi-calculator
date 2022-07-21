import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  const GenderButton({
    Key? key,
    required this.genderIcon,
    required this.genderText,
    this.genderIconColor,
    this.onTap,
    this.selectedColor,
  }) : super(key: key);

  final IconData genderIcon;
  final String genderText;
  final Color? genderIconColor;
  final Function()? onTap;
  final Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selectedColor,
          border: Border.all(color: const Color(0xFF444444)),
          borderRadius: const BorderRadius.all(
            Radius.elliptical(20, 10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            children: [
              Icon(
                genderIcon,
                color: genderIconColor,
                size: 50.0,
              ),
              Text(genderText),
            ],
          ),
        ),
      ),
    );
  }
}
