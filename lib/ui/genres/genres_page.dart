import 'package:books_progect/cubits/helper/cubit/helpers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class GenresPage extends StatefulWidget {
  const GenresPage({super.key});

  @override
  State<GenresPage> createState() => _GenresPageState();
}

class _GenresPageState extends State<GenresPage> {
  @override
  void initState() {
    BlocProvider.of<HelpersCubit>(context).getAllGener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Genres")),
      body: BlocBuilder<HelpersCubit, HelpersState>(builder: (context, state) {
        if (state.formzStatus == FormzStatus.submissionInProgress) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state.formzStatus == FormzStatus.submissionFailure) {
          return Center(
            child: Text(state.errorText.toString()),
          );
        } else {
          return ListView(
            children: List.generate(
                state.genres.length,
                (index) => ListTile(
                      title: Text(state.genres[index].name),
                    )),
          );
        }
      }),
    );
  }
}
