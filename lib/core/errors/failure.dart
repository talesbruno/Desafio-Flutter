abstract class Failure {
  final String message;
  
  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({String message = 'Erro no servidor.'}) : super(message: message);
}

class ValidationFailure extends Failure {
  ValidationFailure({String message = 'Falha na validação.'}) : super(message: message);
}

class NetworkFailure extends Failure {
  NetworkFailure({String message = 'Problemas de conexão com a rede.'}) : super(message: message);
}

