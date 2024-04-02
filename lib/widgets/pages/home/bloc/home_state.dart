part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class CarLoading extends HomeState {}

class CarLoaded extends HomeState {
  final List<CarModel> cars;

  CarLoaded(this.cars);
}
class PostCardSuccess extends HomeState {}

class CarError extends HomeState {
  final String message;

  CarError(this.message);
}