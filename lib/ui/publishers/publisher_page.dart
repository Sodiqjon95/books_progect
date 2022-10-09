import 'package:books_progect/cubits/publishers/cubit/publishers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class PublisherPage extends StatefulWidget {
  const PublisherPage({super.key});

  @override
  State<PublisherPage> createState() => _PublisherPageState();
}

class _PublisherPageState extends State<PublisherPage> {
  @override
  void initState() {
    BlocProvider.of<PublishersCubit>(context).getAllPublisher();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Publisher page")),
      body: BlocBuilder<PublishersCubit, PublishersState>(
        builder: (context, state) {
          if (state.formzStatus == FormzStatus.submissionInProgress) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
            // debugPrint("xatoooxatoooooo");
          } else if (state.formzStatus == FormzStatus.submissionFailure) {
            return  Center(
              child: Text(state.errorText.toString()),
            );
          } else {
            return ListView(
              children: List.generate(
                state.publishers.length,
                (index) => ListTile(
                  title: Text(state.publishers[index].name),
                  trailing: IconButton(
                    onPressed: () {
                      context
                          .read<PublishersCubit>()
                          .deletePublisherById(state.publishers[index].id);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "asdadfad",
            onPressed: () => context.read<PublishersCubit>().getAllPublisher(),
            child: const Icon(
              Icons.download,
              color: Colors.black,
            ),
          ),
          FloatingActionButton(onPressed: (){
            
            context.read<PublishersCubit>().postPublisher("AsSaxiy booKs");
          },
          child: const Icon(Icons.add),)
        ],
      ),
    );
  }
}
