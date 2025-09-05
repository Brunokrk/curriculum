import 'package:flutter/material.dart';

class PhotoBox extends StatelessWidget {
  final String photo;
  final Color borderColor;
  const PhotoBox({super.key, required this.photo, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final photoSize = screenSize.width < 600 ? 220.0 : 250.0;
    return Container(
      width: photoSize,
      height: photoSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor,
          width: 4.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          photo, // fixed
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}