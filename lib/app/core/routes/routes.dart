import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tmdb_watchmate/app/presentation/pages/home_page.dart';
import 'package:tmdb_watchmate/app/presentation/pages/movie_details_page.dart';

RouteFactory onGenerateRoute() {
  return (settings) {
    final page = switch (settings.name) {
      '/home' => HomePage(),
      '/movie_details' => MovieDetailsPage(id: settings.arguments as int),
      _ => HomePage(),
    };

    return PageTransition(
      child: page,
      type: PageTransitionType.fade,
      maintainStateData: false,
    );
  };
}
