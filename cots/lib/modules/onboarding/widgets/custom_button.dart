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
      width: double.infinity, // Tombol mengambil lebar penuh
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? AppColors.primaryGreen : AppColors.backgroundWhite,
          foregroundColor: isPrimary ? AppColors.backgroundWhite : AppColors.primaryGreen,
          side: isPrimary
              ? null
              : BorderSide(color: AppColors.primaryGreen, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // Radius bulat
          ),
          minimumSize: const Size(0, 50), // Ukuran minimum untuk tinggi tombol
          padding: const EdgeInsets.symmetric(horizontal: 16), // Padding horizontal
          elevation: isPrimary ? 4 : 0, // Elevasi untuk tombol solid
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16, // Ukuran font tombol
            color: isPrimary ? Colors.white : AppColors.primaryGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
