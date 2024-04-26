part of 'k3_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///K3 widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class K3Event extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the K3 widget is first created.
class K3InitialEvent extends K3Event {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility

// ignore_for_file: must_be_immutable
class ChangePasswordVisibilityEvent extends K3Event {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [value];
}

///Event for changing password visibility

// ignore_for_file: must_be_immutable
class ChangePasswordVisibilityEvent1 extends K3Event {
  ChangePasswordVisibilityEvent1({required this.value});

  bool value;

  @override
  List<Object?> get props => [value];
}
