import 'package:flutter/material.dart';
import 'package:cots/design_system/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, 
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? AppColors.primaryGreen : AppColors.backgroundWhite,
          foregroundColor: isPrimary ? AppColors.backgroundWhite : AppColors.primaryGreen,
          side: isPrimary
              ? null
              : BorderSide(color: AppColors.primaryGreen, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), 
          ),
          minimumSize: const Size(0, 50), 
          padding: const EdgeInsets.symmetric(horizontal: 16), 
          elevation: isPrimary ? 4 : 0, 
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16, 
            color: isPrimary ? Colors.white : AppColors.primaryGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
