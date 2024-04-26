part of 'k1_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///K1 widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class K1Event extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the K1 widget is first created.
class K1InitialEvent extends K1Event {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility

// ignore_for_file: must_be_immutable
class ChangePasswordVisibilityEvent extends K1Event {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [value];
}
