import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/k1_model.dart';
part 'k1_event.dart';
part 'k1_state.dart';

/// A bloc that manages the state of a K1 according to the event that is dispatched to it.
class K1Bloc extends Bloc<K1Event, K1State> {
  K1Bloc(K1State initialState) : super(initialState) {
    on<K1InitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<K1State> emit,
  ) {
    emit(state.copyWith(
      isShowPassword: event.value,
    ));
  }

  _onInitialize(
    K1InitialEvent event,
    Emitter<K1State> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      isShowPassword: true,
    ));
  }
}
