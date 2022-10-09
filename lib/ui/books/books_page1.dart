import 'package:books_progect/cubits/book/cubit/books_cubit.dart';
import 'package:books_progect/ui/publishers/publisher_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/publishers/cubit/publishers_cubit.dart';
import '../genres/genres_page.dart';
import 'all_books.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  void initState() {
    BlocProvider.of<BooksCubit>(context).getAllBooks();
    // BlocProvider.of<PublishersCubit>(context).getAllPublisher();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: Drawer(
              backgroundColor: Colors.white,
              semanticLabel: "helo",
              child: Column(
                children: [
                  Image.asset(
                      "assets/images/istockphoto-468382096-612x612.jpg"),
                ],
              )),
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: const Text("Books Club"),
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.book),
              ),
              Tab(
                icon: Icon(Icons.edit),
              ),
              Tab(
                icon: Icon(Icons.save),
              ),
            ]),
          ),
          body:  TabBarView(children: [
            AllBooks(),
            PublisherPage(),
            GenresPage(),
          ]),
        ),
      ),
    );
  }
}
