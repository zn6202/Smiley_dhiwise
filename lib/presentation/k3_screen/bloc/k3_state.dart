part of 'k3_bloc.dart';

/// Represents the state of K3 in the application.

// ignore_for_file: must_be_immutable
class K3State extends Equatable {
  K3State(
      {this.emailAddressController,
      this.passwordOneController,
      this.confirmPasswordController,
      this.isShowPassword = true,
      this.isShowPassword1 = true,
      this.k3ModelObj});

  TextEditingController? emailAddressController;

  TextEditingController? passwordOneController;

  TextEditingController? confirmPasswordController;

  K3Model? k3ModelObj;

  bool isShowPassword;

  bool isShowPassword1;

  @override
  List<Object?> get props => [
        emailAddressController,
        passwordOneController,
        confirmPasswordController,
        isShowPassword,
        isShowPassword1,
        k3ModelObj
      ];
  K3State copyWith({
    TextEditingController? emailAddressController,
    TextEditingController? passwordOneController,
    TextEditingController? confirmPasswordController,
    bool? isShowPassword,
    bool? isShowPassword1,
    K3Model? k3ModelObj,
  }) {
    return K3State(
      emailAddressController:
          emailAddressController ?? this.emailAddressController,
      passwordOneController:
          passwordOneController ?? this.passwordOneController,
      confirmPasswordController:
          confirmPasswordController ?? this.confirmPasswordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      k3ModelObj: k3ModelObj ?? this.k3ModelObj,
    );
  }
}
