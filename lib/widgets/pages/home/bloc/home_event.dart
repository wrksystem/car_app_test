part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchCars extends HomeEvent {}

class PostLead extends HomeEvent {
  PostLead(this.car);

  final CarModel car;
}