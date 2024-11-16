import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';

abstract class ValidationRepository {
  Future<Either<Failure, String>> validatePassword(String password);
}