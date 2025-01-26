import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_login/future_Lap/home/model/data/get_laptop/get_laptop.dart';
import 'package:post_login/future_Lap/home/model/model/laptop_model/lap_home.dart';

part 'lap_top_state.dart';

class LapTopCubit extends Cubit<LapTopState> {
  LapTopCubit() : super(LapTopInitial());

  final GetLaptop getLaptop = GetLaptop();
  getLaptopcupit() async {
    emit(LapTopLoading());
    List<LaptopModel> viewdata = await getLaptop.getlaptopdata();
    emit(LapTopsuccess(viewlap: viewdata));
  }
}
