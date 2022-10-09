import 'package:books_progect/ui/home/home_page.dart';
import 'package:books_progect/ui/publishers/publisher_page.dart';
import 'package:books_progect/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'books/books_page1.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case splashPage:

        return navigateTo(const SplashPage());

      case homePage:
        return navigateTo(const HomePage());

      case booksPage:
        return navigateTo(const BooksPage());

        case publisher:
        return navigateTo(const PublisherPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
navigateTo(Widget widget) => MaterialPageRoute(builder: (context) => widget,);