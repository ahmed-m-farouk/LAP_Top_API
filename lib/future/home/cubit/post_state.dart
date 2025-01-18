part of 'post_cubit.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostSuccessLogin extends PostState {
  final dynamic userdata;
  PostSuccessLogin({required this.userdata});
}

final class PostError extends PostState {
  final String errorMessage;
  PostError({required this.errorMessage});
}

final class PostSuccessRegister extends PostState {
  final dynamic userdata;
  PostSuccessRegister({required this.userdata});
}
