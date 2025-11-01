import 'package:flutter/material.dart';

class MovieSkeletonItem extends StatelessWidget {
  const MovieSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primary,
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 120,
              height: 180,
              color: Colors.grey[300],
            ),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 18,
                    width: 150,
                    color: Colors.grey[300],
                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 16,
                    width: 100,
                    color: Colors.grey[300],
                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 16,
                    width: 80,
                    color: Colors.grey[300],
                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 16,
                    width: 60,
                    color: Colors.grey[300],
                  ),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 40,
                    width: 120,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
