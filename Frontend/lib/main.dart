import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_with_painated_list_view/data/data_sources/remote_data_source.dart';
import 'package:flutter_with_painated_list_view/data/repositories/store_repository_impl.dart';
import 'package:flutter_with_painated_list_view/domain/repository/store_repository.dart';
import 'package:flutter_with_painated_list_view/presentation/Bloc/Cubits/common/paginated_list/paginated_list_cubit.dart';
import 'package:flutter_with_painated_list_view/presentation/screens/home/home_screen.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<StoreRemoteDataSource>(
      () => StoreRemoteDataSourceImpl());

  getIt.registerLazySingleton<StoreRepoistory>(
      () => StoreRepositoryImpl(storeDataSource: getIt()));

  getIt.registerLazySingleton<PaginatedListCubit>(
      () => PaginatedListCubit(storeRepoistory: getIt()));
}

void main() {
  setupLocator();
  runApp(
    BlocProvider(
      create: (context) => getIt<PaginatedListCubit>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter With Paginated ListView',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
