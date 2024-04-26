part of 'k0_bloc.dart';

/// Represents the state of K0 in the application.

// ignore_for_file: must_be_immutable
class K0State extends Equatable {
  K0State({this.k0ModelObj});

  K0Model? k0ModelObj;

  @override
  List<Object?> get props => [k0ModelObj];
  K0State copyWith({K0Model? k0ModelObj}) {
    return K0State(
      k0ModelObj: k0ModelObj ?? this.k0ModelObj,
    );
  }
}
