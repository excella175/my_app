// attendance_buttons.dart
import 'package:flutter/material.dart';

class AttendanceButtons extends StatelessWidget {
  final VoidCallback onPresentPressed;
  final VoidCallback onAttachPressed;

  const AttendanceButtons({
    Key? key,
    required this.onPresentPressed,
    required this.onAttachPressed, required Null Function() onPresentTap, required Null Function() onAttachTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
      child: Row(
        children: [
          // Hadir button
          Expanded(
            child: ElevatedButton.icon(
              onPressed: onPresentPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A237E), // Deep blue
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                shadowColor: const Color(0xFF1A237E).withOpacity(0.5),
              ),
              icon: const Icon(Icons.check_circle_outline),
              label: const Text(
                "HADIR",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          // Lampirkan button
          Expanded(
            child: ElevatedButton.icon(
              onPressed: onAttachPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF1A237E),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: Color(0xFF1A237E)),
                ),
                elevation: 2,
                shadowColor: Colors.black.withOpacity(0.1),
              ),
              icon: const Icon(Icons.attach_file),
              label: const Text(
                "LAMPIRKAN",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
