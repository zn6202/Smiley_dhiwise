part of 'k1_bloc.dart';

/// Represents the state of K1 in the application.

// ignore_for_file: must_be_immutable
class K1State extends Equatable {
  K1State(
      {this.emailController,
      this.passwordController,
      this.isShowPassword = true,
      this.k1ModelObj});

  TextEditingController? emailController;

  TextEditingController? passwordController;

  K1Model? k1ModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props =>
      [emailController, passwordController, isShowPassword, k1ModelObj];
  K1State copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    K1Model? k1ModelObj,
  }) {
    return K1State(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      k1ModelObj: k1ModelObj ?? this.k1ModelObj,
    );
  }
}
