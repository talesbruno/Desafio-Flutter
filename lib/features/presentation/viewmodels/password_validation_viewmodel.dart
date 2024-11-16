import 'package:flutter/material.dart';
import '../../domain/usecases/validate_password_usecase.dart';

class PasswordValidationViewModel extends ChangeNotifier {
  final ValidatePasswordUseCase validatePasswordUseCase;

  PasswordValidationViewModel(this.validatePasswordUseCase);

  String? errorMessage;
  String? successMessage;

  Future<void> validatePassword(String password) async {
    final result = await validatePasswordUseCase(password);

    result.fold(
      (failure) {
        errorMessage = 'Erro ao validar senha. Tente novamente.';
        successMessage = null;
        notifyListeners();
      },
      (message) {
        successMessage = message;
        errorMessage = null;
        notifyListeners();
      },
    );
  }
}