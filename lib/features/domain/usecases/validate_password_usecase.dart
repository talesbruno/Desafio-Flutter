import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../repositories/validation_repository.dart';

class ValidatePasswordUseCase {
  final ValidationRepository repository;

  ValidatePasswordUseCase(this.repository);

  Future<Either<Failure, String>> call(String password) {
    return repository.validatePassword(password);
  }
}