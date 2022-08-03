part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int countValue;
  final bool? wasIncremented;

  const CounterState({
    required this.countValue,
    this.wasIncremented,
  });

  @override
  List<Object?> get props => [countValue, wasIncremented];
}
