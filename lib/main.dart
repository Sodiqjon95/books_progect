import 'package:books_progect/cubits/book/cubit/books_cubit.dart';
import 'package:books_progect/cubits/counter/counter_cubit.dart';
import 'package:books_progect/cubits/helper/cubit/helpers_cubit.dart';
import 'package:books_progect/cubits/publishers/cubit/publishers_cubit.dart';
import 'package:books_progect/data/local/storage.dart';
import 'package:books_progect/data/repositories/books_repository.dart';
import 'package:books_progect/data/repositories/helper_repository.dart';
import 'package:books_progect/data/repositories/publishers_repository.dart';
import 'package:books_progect/data/service/api_proider.dart';
import 'package:books_progect/ui/no_internet/no_internet.dart';
import 'package:books_progect/ui/router.dart';
import 'package:books_progect/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/service/api_client.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final ApiProvider apiProvider = ApiProvider(
    apiClient: ApiClient(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<BooksRepository>(
            create: (_) => BooksRepository(apiProvider: apiProvider),
          )
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (BuildContext context) => CounterCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => BooksCubit(
              booksRepository: context.read<BooksRepository>(),
            ),
          ),
          BlocProvider(
            create: (BuildContext context) => HelpersCubit(
              helperRepository: HelperRepository(apiProvider: apiProvider),
            ),
          ),
          BlocProvider(
            create: (BuildContext context) => PublishersCubit(
              publisherRepository:
                  PublisherRepository(apiProvider: apiProvider),
            ),
          ),
        ], child:const MyApp()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) {
          return StreamBuilder(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                if (snapshot.data == ConnectivityResult.none) {
                  return const NoInternetPage();
                }
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                      textScaleFactor: 1.0, alwaysUse24HourFormat: true),
                  child: child!,
                );
              });
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: MyRouter.generateRoute,
        initialRoute: splashPage // mainPage,
        );
  }
}
