import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_login/future/home/model/data/post_data_login/post_login.dart';
import 'package:post_login/future/home/model/data/post_data_register/post_data_register.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());
  PostLogin postLogin = PostLogin();

  postDataCupit({
    required emaildata,
    required passworddata,
  }) async {
    var user = await postLogin.postData(
      email: emaildata,
      password: passworddata,
    );

    emit(PostSuccessLogin(userdata: user));
  }

  PostDataRegister postDataRegister = PostDataRegister();
  postRegistercupit({
    required String namedata,
    required String emaildata,
    required String phonedata,
    required String nationalIddata,
    required String genderdata,
    required String passworddata,
    required String tokendata,
    required String profileImagedata,
  })async {
    var responsedata =await postDataRegister.postRegister(
      name: namedata,
      email: emaildata,
      phone: phonedata,
      nationalId: nationalIddata,
      gender: genderdata,
      password: passworddata,
      token: tokendata,
      profileImage: profileImagedata,
    );
    emit(PostSuccessRegister(userdata: responsedata));
  }
}
