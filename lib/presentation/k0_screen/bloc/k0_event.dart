part of 'k0_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///K0 widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class K0Event extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the K0 widget is first created.
class K0InitialEvent extends K0Event {
  @override
  List<Object?> get props => [];
}
