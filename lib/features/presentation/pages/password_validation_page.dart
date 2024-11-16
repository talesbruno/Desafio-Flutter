import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/password_validation_viewmodel.dart';
import '../pages/success_page.dart';

class PasswordValidationPage extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Validação de Senha')),
      body: Consumer<PasswordValidationViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Digite sua senha',
                    errorText: viewModel.errorMessage,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    await viewModel.validatePassword(_passwordController.text);
                    if (viewModel.successMessage != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuccessPage(viewModel.successMessage!),
                        ),
                      );
                    }
                  },
                  child: Text('Validar'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
