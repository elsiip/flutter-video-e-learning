
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_elearning/bloc/post_bloc.dart';
import 'package:video_elearning/data/repository/api_repository.dart';
import 'package:video_elearning/presentation/screen/HomeScreen.dart';
import 'package:video_elearning/service/data_repository.dart';

void main() {
  runApp(MyApp(
    dataService: DataService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.dataService}) : super(key: key);
  final DataService dataService;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Api',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>
            PostBloc(apiRepository: ApiRepository(dataService: dataService))
              ..add(LoadEvent()),
        child: HomeScreen(),
      ),
    );
  }
}