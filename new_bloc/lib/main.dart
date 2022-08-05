import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bloc/logic/cubit/counter_cubit.dart';
import 'package:new_bloc/logic/cubit/internet_cubit.dart';
import 'package:new_bloc/presentation/router/app_router.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;
  const MyApp({Key? key, required this.appRouter, required this.connectivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (_) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (_) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
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
