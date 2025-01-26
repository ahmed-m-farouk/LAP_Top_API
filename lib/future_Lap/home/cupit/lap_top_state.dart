part of 'lap_top_cubit.dart';

@immutable
sealed class LapTopState {}

final class LapTopInitial extends LapTopState {}

final class LapTopLoading extends LapTopState {}

final class LapTopFaluier extends LapTopState {}

final class LapTopsuccess extends LapTopState {
  final List<LaptopModel> viewlap;
  LapTopsuccess({required this.viewlap});
}
