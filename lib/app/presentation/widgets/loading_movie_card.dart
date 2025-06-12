import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingMovieCard extends StatelessWidget {
  final bool onlyImage;

  const LoadingMovieCard({super.key, this.onlyImage = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.withValues(alpha: (0.8)),
        highlightColor: Colors.blueGrey.withValues(alpha: (0.8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 185,
              height: 260,
              margin: const EdgeInsets.only(bottom: 16, right: 16),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: (0.8)),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            if (!onlyImage) ...[
              Container(
                width: 150,
                height: 10,
                margin: const EdgeInsets.only(bottom: 16, right: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: (0.8)),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Container(
                width: 90,
                height: 10,
                margin: const EdgeInsets.only(bottom: 16, right: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: (0.8)),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
