part of 'k2_bloc.dart';

/// Represents the state of K2 in the application.

// ignore_for_file: must_be_immutable
class K2State extends Equatable {
  K2State({this.emailaddressController, this.k2ModelObj});

  TextEditingController? emailaddressController;

  K2Model? k2ModelObj;

  @override
  List<Object?> get props => [emailaddressController, k2ModelObj];
  K2State copyWith({
    TextEditingController? emailaddressController,
    K2Model? k2ModelObj,
  }) {
    return K2State(
      emailaddressController:
          emailaddressController ?? this.emailaddressController,
      k2ModelObj: k2ModelObj ?? this.k2ModelObj,
    );
  }
}
