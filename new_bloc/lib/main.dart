import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bloc/logic/cubit/counter_cubit.dart';
import 'package:new_bloc/presentation/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // final CounterCubit _counterCubit = CounterCubit();
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
        // routes: {
        //   '/': (_) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const HomeScreen(
        //           title: 'HomeScreen',
        //           color: Colors.blueAccent,
        //         ),
        //       ),
        //   '/second': (_) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const SecondScreen(
        //           title: 'SecondScreen',
        //           color: Colors.redAccent,
        //         ),
        //       ),
        //   '/third': (_) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const ThirdScreen(
        //           title: 'thirdScreen',
        //           color: Colors.greenAccent,
        //         ),
        //       ),
        // },
        // home: BlocProvider(
        //   create: (context) => CounterCubit(),
        //   child: const HomeScreen(
        //     title: 'Flutter Demo Home Page',
        //     color: Colors.blueAccent,
        //   ),
        // ),
      ),
    );
  }
}
