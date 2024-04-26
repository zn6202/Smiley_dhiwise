import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/k3_model.dart';
part 'k3_event.dart';
part 'k3_state.dart';

/// A bloc that manages the state of a K3 according to the event that is dispatched to it.
class K3Bloc extends Bloc<K3Event, K3State> {
  K3Bloc(K3State initialState) : super(initialState) {
    on<K3InitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<K3State> emit,
  ) {
    emit(state.copyWith(
      isShowPassword: event.value,
    ));
  }

  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<K3State> emit,
  ) {
    emit(state.copyWith(
      isShowPassword1: event.value,
    ));
  }

  _onInitialize(
    K3InitialEvent event,
    Emitter<K3State> emit,
  ) async {
    emit(state.copyWith(
      emailAddressController: TextEditingController(),
      passwordOneController: TextEditingController(),
      confirmPasswordController: TextEditingController(),
      isShowPassword: true,
      isShowPassword1: true,
    ));
  }
}
