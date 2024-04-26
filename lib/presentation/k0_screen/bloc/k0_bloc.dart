import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/k0_model.dart';
part 'k0_event.dart';
part 'k0_state.dart';

/// A bloc that manages the state of a K0 according to the event that is dispatched to it.
class K0Bloc extends Bloc<K0Event, K0State> {
  K0Bloc(K0State initialState) : super(initialState) {
    on<K0InitialEvent>(_onInitialize);
  }

  _onInitialize(
    K0InitialEvent event,
    Emitter<K0State> emit,
  ) async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.k1Screen,
      );
    });
  }
}
