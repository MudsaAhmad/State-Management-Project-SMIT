import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  final Color color;
  final String? imagePath;
  final double? width;
  final double? height;

  Button({
    super.key,
    required this.title,
    required this.onTap,
    required this.isLoading,
    required this.color,
    this.imagePath,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap, // Disable tap when loading
      child: Container(
        height: height ?? 55,
        width: width ?? 330,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          alignment: Alignment.center, // Centers the text or loader
          children: [
            Center(
              child: isLoading
                  ? LoadingAnimationWidget.waveDots(
                color: Colors.white,
                size: 30,
              )
                  : Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            if (imagePath != null)
              Positioned(
                right: 20, // Adjust as needed
                child: Image.asset(
                  imagePath!,
                  scale: 4,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
