import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../domain/repositories/validation_repository.dart';

class ValidationRepositoryImpl implements ValidationRepository {
  final http.Client client;

  ValidationRepositoryImpl(this.client);

  @override
  Future<Either<Failure, String>> validatePassword(String password) async {
    final url = Uri.parse('https://desafioflutter-api.modelviewlabs.com/validate');
    
    try {
      final response = await client.post(url, body: jsonEncode({'password': password}));
      
      if (response.statusCode == 202) {
        final result = jsonDecode(response.body);
        return Right(result['message']);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}