import 'package:books_progect/cubits/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page"),),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Center(
            child: Text("My number value: $state"),
          );
        },
      ),
      floatingActionButton: Column(
               mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: ()=> context.read<CounterCubit>().increment(),
          child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
              TextButton(
              onPressed: () {
                Navigator.pushNamed(context, booksPage);
              },
              child:const Text("Books")),
              TextButton(
              onPressed: () {
                Navigator.pushNamed(context, publisher);
              },
              child:const Text("publisher")),

      ]),
    );
  }
}