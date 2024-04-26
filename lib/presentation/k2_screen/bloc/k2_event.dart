part of 'k2_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///K2 widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class K2Event extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the K2 widget is first created.
class K2InitialEvent extends K2Event {
  @override
  List<Object?> get props => [];
}
