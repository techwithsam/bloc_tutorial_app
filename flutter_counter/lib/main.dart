import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Bloc Try',
        theme: ThemeData(),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppBar')),
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.isIncrement == true) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Incremented')));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Decremented')));
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You have the button this times:'),
                Text('${state.value}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
