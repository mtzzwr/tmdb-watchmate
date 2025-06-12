import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingMovieDetails extends StatelessWidget {
  const LoadingMovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withValues(alpha: (0.8)),
      highlightColor: Colors.blueGrey.withValues(alpha: (0.8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 320,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: (0.8)),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: (0.8)),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: (0.8)),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
