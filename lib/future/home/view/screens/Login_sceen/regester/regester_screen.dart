import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_login/future/home/cubit/post_cubit.dart';
import 'package:post_login/future/home/view/widgets/widgetTextff/wdget_textff.dart';
import 'package:post_login/core/validotor.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تعريف الكنترولر لكل الحقول
    TextEditingController nameControl = TextEditingController();
    TextEditingController tokenControl = TextEditingController();
    TextEditingController emailControl = TextEditingController();
    TextEditingController passControl = TextEditingController();
    TextEditingController imageControl = TextEditingController();
    TextEditingController nationalControl = TextEditingController();
    TextEditingController phoneControl = TextEditingController();
    TextEditingController genderControl = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        PostCubit cupit = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              'Register',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        // حقل الاسم
                        defoultTextFF(
                          type: TextInputType.name,
                          controller: nameControl,
                          onfiled: (value) {},
                          validat: MyValidators.displayNameValidator,
                          prifix: Icons.person,
                          suffix: Icons.delete,
                          suffixfunction: () {
                            nameControl.clear();
                          },
                          lableText: 'الاسم',
                          hintText: 'أدخل اسمك',
                        ),
                        const SizedBox(height: 10),
                        // حقل البريد الجندر
                        defoultTextFF(
                          type: TextInputType.emailAddress,
                          controller: genderControl,
                          onfiled: (value) {},
                          validat: (value) {
                            MyValidators.genderValidator(value: value);
                            return null;
                          },
                          prifix: Icons.transgender,
                          suffix: Icons.delete,
                          suffixfunction: () {
                            nameControl.clear();
                          },
                          lableText: 'النوع',
                          hintText: 'أدخل النوع',
                        ),
                        const SizedBox(height: 10),
                        // حقل الهاتف
                        defoultTextFF(
                          type: TextInputType.phone,
                          controller: phoneControl,
                          onfiled: (value) {},
                          validat: MyValidators.phoneValidator,
                          prifix: Icons.phone,
                          suffix: Icons.delete,
                          suffixfunction: () {
                            nameControl.clear();
                          },
                          lableText: 'رقم الهاتف',
                          hintText: 'أدخل رقم هاتفك',
                        ),
                        const SizedBox(height: 10),
                        // حقل البريد الإلكتروني
                        defoultTextFF(
                          type: TextInputType.emailAddress,
                          controller: emailControl,
                          onfiled: (value) {},
                          validat: MyValidators.emailValidator,
                          prifix: Icons.email,
                          suffix: Icons.delete,
                          suffixfunction: () {
                            nameControl.clear();
                          },
                          lableText: 'البريد الإلكتروني',
                          hintText: 'أدخل بريدك الإلكتروني',
                        ),
                        const SizedBox(height: 10),

                        // حقل كلمة المرور
                        defoultTextFF(
                          type: TextInputType.visiblePassword,
                          controller: passControl,
                          onfiled: (value) {},
                          validat: MyValidators.passwordValidator,
                          prifix: Icons.lock,
                          suffix: Icons.delete,
                          suffixfunction: () {
                            nameControl.clear();
                          },
                          lableText: 'كلمة المرور',
                          hintText: 'أدخل كلمة المرور',
                        ),
                        const SizedBox(height: 10),

                        // حقل التوكين
                        defoultTextFF(
                          type: TextInputType.text,
                          controller: tokenControl,
                          onfiled: (value) {},
                          validat: MyValidators.tokenValidator,
                          prifix: Icons.vpn_key,
                          suffix: Icons.delete,
                          suffixfunction: () {
                            nameControl.clear();
                          },
                          lableText: 'Token',
                          hintText: 'أدخل التوكين الخاص بك',
                        ),

                        const SizedBox(height: 10),
                        // حقل الصورة
                        defoultTextFF(
                          type: TextInputType.text,
                          controller: imageControl,
                          onfiled: (value) {},
                          validat: MyValidators.imageValidator,
                          prifix: Icons.image,
                          suffix: Icons.delete,
                          suffixfunction: () {
                            nameControl.clear();
                          },
                          lableText: 'الصورة',
                          hintText: 'أدخل رابط الصورة',
                        ),
                        const SizedBox(height: 10),
                        // حقل الرقم الفومي
                        defoultTextFF(
                          type: TextInputType.number,
                          controller: nationalControl,
                          onfiled: (value) {},
                          validat: MyValidators.nationalIdValidator,
                          prifix: Icons.account_box,
                          suffix: Icons.delete,
                          suffixfunction: () {
                            nameControl.clear();
                          },
                          lableText: 'الرقم القومي',
                          hintText: 'أدخل الرقم القومي',
                        ),
                        const SizedBox(height: 15),
                        Container(
                          height: 50,
                          width: 150,
                          color: Colors.blue,
                          child: IconButton(
                              onPressed: () {
                                cupit.postRegistercupit(
                                    namedata: nameControl.text,
                                    emaildata: emailControl.text,
                                    phonedata: phoneControl.text,
                                    nationalIddata: nationalControl.text,
                                    genderdata: genderControl.text,
                                    passworddata: passControl.text,
                                    tokendata: tokenControl.text,
                                    profileImagedata: imageControl.text);
                              },
                              icon: Text('Register')),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
