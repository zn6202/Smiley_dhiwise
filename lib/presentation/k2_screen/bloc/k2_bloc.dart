import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/k2_model.dart';
part 'k2_event.dart';
part 'k2_state.dart';

/// A bloc that manages the state of a K2 according to the event that is dispatched to it.
class K2Bloc extends Bloc<K2Event, K2State> {
  K2Bloc(K2State initialState) : super(initialState) {
    on<K2InitialEvent>(_onInitialize);
  }

  _onInitialize(
    K2InitialEvent event,
    Emitter<K2State> emit,
  ) async {
    emit(state.copyWith(
      emailaddressController: TextEditingController(),
    ));
  }
}
