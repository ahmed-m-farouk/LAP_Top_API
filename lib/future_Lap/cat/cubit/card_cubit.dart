import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_login/future_Lap/cat/model/car_data.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInitial());
  CardCubit get(context) => BlocProvider.of(context);

  CardData cardData = CardData();
  cardDataCupit() {
    emit(CardLoding());
    cardData.getCarddata();
    emit(CardSuccess());
  }
}
