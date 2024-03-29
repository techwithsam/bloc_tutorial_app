import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bloc/constants/enums.dart';
import 'package:new_bloc/logic/cubit/counter_cubit.dart';
import 'package:new_bloc/logic/cubit/internet_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);
  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: widget.color,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Wifi) {
                    return const Text('Wifi');
                  } else if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Mobile) {
                    return const Text('Mobile');
                  } else if (state is InternetDisconnected) {
                    return const Text('Disconnected');
                  }
                  return const CircularProgressIndicator();
                },
              ),
              const Text('You have pushed the button this many times:'),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Incremented')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Decremented')));
                  }
                },
                builder: (context, state) {
                  return Text(
                    '${state.countValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    backgroundColor: widget.color,
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    tooltip: 'Decrement',
                    backgroundColor: widget.color,
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
                color: widget.color,
                child: const Text('Go to Second Screen'),
              ),
              const SizedBox(height: 24),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
                color: widget.color,
                child: const Text('Go to Third Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
