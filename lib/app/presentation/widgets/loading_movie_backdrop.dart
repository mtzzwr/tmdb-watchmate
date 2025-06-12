import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingMovieBackdrop extends StatelessWidget {
  const LoadingMovieBackdrop({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withValues(alpha: (0.8)),
      highlightColor: Colors.blueGrey.withValues(alpha: (0.8)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(color: Colors.grey.withValues(alpha: (0.8))),
      ),
    );
  }
}
