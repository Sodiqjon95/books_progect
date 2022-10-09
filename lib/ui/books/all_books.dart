import 'package:books_progect/cubits/book/cubit/books_cubit.dart';
import 'package:books_progect/ui/books/widgets/book_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AllBooks extends StatefulWidget {
  AllBooks({super.key});

  @override
  State<AllBooks> createState() => _AllBooksState();
}

class _AllBooksState extends State<AllBooks> {
  TextEditingController bokName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<BooksCubit>().getAllBooks();
      },
      child: Scaffold(
        body: BlocBuilder<BooksCubit, BooksState>(
          builder: (context, state) {
            if (state.formzStatus == FormzStatus.submissionInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.formzStatus == FormzStatus.submissionFailure) {
              return const Center(
                child: Text("Error"),
              );
            } else {
              return GestureDetector(
                onDoubleTap: () => {},
                child: ListView(
                  children: List.generate(
                    state.books.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.black.withOpacity(0.11),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/atomic.png",
                              scale: 5,
                            ),
                            Text(
                              state.books[index].title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "price: \$ ${state.books[index].price}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                      Icons.shopping_cart_checkout_sharp),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    showDialog(
                                        useRootNavigator: false,
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: const Text("Delete"),
                                              content: const Text(
                                                  "Rosdanham O'chirmoqchimisiz"),
                                              actions: [
                                                TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    child:
                                                        const Text("CANCEL")),
                                                TextButton(
                                                    onPressed: () {
                                                      context
                                                          .read<BooksCubit>()
                                                          .deleteBookById(state
                                                              .books[index].id);
                                                      Navigator.pop(context);

                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        backgroundColor:
                                                            Colors.orangeAccent,
                                                        content: Text(
                                                          'delete ${state.books[index].title}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        duration:
                                                            const Duration(
                                                                seconds: 2),
                                                      ));
                                                    },
                                                    child: const Text("OK"))
                                              ],
                                            ));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
        floatingActionButton:
            FloatingActionButton(
              heroTag: "qwer",
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  context: context,
                  builder: (context) {
                    return 
                     Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                       decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, -5),
                                  blurRadius: 10,
                                )
                              ]),
                          height: MediaQuery.of(context).size.height*0.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(child: const Text("dd book",style:  TextStyle(fontSize: 24),)),
                              MyTextFormFild(title: "book name",controller: bokName,),
                              MyTextFormFild(title: "Pages",controller: bokName,),
                              MyTextFormFild(title: "price",controller: bokName,),
                              MyTextFormFild(title: "publishYear",controller: bokName,),
                              ExpansionTile(title: Text("genre"),children: [
                                TextButton(onPressed: (){}, child: Text("arcadi")),
                                TextButton(onPressed: (){}, child: Text("arcadi")),
                                TextButton(onPressed: (){}, child: Text("arcadi")),
                                TextButton(onPressed: (){}, child: Text("arcadi")),
                                TextButton(onPressed: (){}, child: Text("arcadi")),
                              ],),
                              ExpansionTile(title: Text("publisherId")),
                              ExpansionTile(title: Text("language")),
                         
                            ],
                          )
                    );
                  },
                );
              },

              // Scaffold.of(context).openDrawer();
              // BookModel bookModel = BookModel(
              //   id: -1,
              //   title: "Musulmonning 35 odobi",r
              //   genre: 4,
              //   isbn: "",
              //   language: 0,
              //   numberOfPages: 200,
              //   price: 30000,
              //   publisherId: 36,
              //   publishYear: 2022,
              // );
              // context.read<BooksCubit>().addBook(bookModel);
              // },
              child: const Icon(Icons.add),
            ),
      ),
    );
  }
}
// ListTile(
//                         tileColor: Colors.orangeAccent,
//                         title: Column(children: [
//                           Text(state.books[index].title),
//                           Text("price: ${state.books[index].price.toString()}"),
//                         ]),
//                         leading: Text(state.books[index].id.toString()),
//                         trailing: IconButton(
//                           onPressed: () {
//                             showDialog(
//                                 useRootNavigator: false,
//                                 context: context,
//                                 builder: ((context) => AlertDialog(
//                                       title: const Text("Delete"),
//                                       content: const Text(
//                                           "Rosdanham O'chirmoqchimisiz"),
//                                       actions: [
//                                         TextButton(
//                                             onPressed: () =>
//                                                 Navigator.pop(context),
//                                             child: const Text("CANCEL")),
//                                         TextButton(
//                                             onPressed: () {
//                                               context
//                                                   .read<BooksCubit>()
//                                                   .deleteBookById(
//                                                       state.books[index].id);
//                                               Navigator.pop(context);

//                                               ScaffoldMessenger.of(context)
//                                                   .showSnackBar(SnackBar(
//                                                 backgroundColor:
//                                                     Colors.orangeAccent,
//                                                 content: Text(
//                                                     'delete ${state.books[index].title}',style: const TextStyle(fontSize: 18,color: Colors.white),),
//                                                 duration:
//                                                     const Duration(seconds: 2),
//                                               ));
//                                             },
//                                             child: const Text("OK"))
//                                       ],
//                                     )));
//                           },
//                           icon: const Icon(
//                             Icons.delete,
//                             color: Colors.red,
//                           ),
//                         ),
//                       ),
                    