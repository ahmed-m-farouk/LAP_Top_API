part of 'card_cubit.dart';

@immutable
sealed class CardState {}

final class CardInitial extends CardState {}

final class CardLoding extends CardState {}

final class CardSuccess extends CardState {}

final class CardFaluier extends CardState {}
