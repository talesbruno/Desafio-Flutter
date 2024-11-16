import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'features/presentation/pages/password_validation_page.dart';
import 'features/presentation/viewmodels/password_validation_viewmodel.dart';
import 'features/domain/usecases/validate_password_usecase.dart';
import 'features/data/repositories/validation_repository_impl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<http.Client>(
          create: (_) => http.Client(),
        ),
        
        ProxyProvider<http.Client, ValidationRepositoryImpl>(
          update: (_, client, __) => ValidationRepositoryImpl(client),
        ),

        ProxyProvider<ValidationRepositoryImpl, ValidatePasswordUseCase>(
          update: (_, repository, __) => ValidatePasswordUseCase(repository),
        ),
        
        ChangeNotifierProvider<PasswordValidationViewModel>(
          create: (context) => PasswordValidationViewModel(
            context.read<ValidatePasswordUseCase>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Password Validation',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PasswordValidationPage(),
      ),
    );
  }
}
