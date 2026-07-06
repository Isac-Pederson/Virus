import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:virus/ui/viewmodel/login_viewmodel.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginViewModelProvider);
    final vm = ref.read(loginViewModelProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/images/logo.png', height: 400),
                const SizedBox(height: 32),

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 16),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    Checkbox(
                      value: state.rememberMe,
                      onChanged: vm.toggleRememberMe,
                    ),
                    const Text('Remember me'),
                  ],
                ),

                if (state.errorMessage != null) ...[
                  const SizedBox(height: 8),
                  Text(state.errorMessage!),
                ],

                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: state.isLoading
                      ? null
                      : () => vm.submit(
                          emailController.text.trim(),
                          passwordController.text,
                        ),
                  child: state.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(state.isSignup ? 'Sign Up' : 'Log In'),
                ),

                TextButton(
                  onPressed: vm.toggleMode,
                  child: Text(
                    state.isSignup
                        ? 'Already have an account? Log in'
                        : "Don't have an account? Sign up",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Text(
          textAlign: TextAlign.center,
          'This app is open source. Free for personal and commercial use.',
          style: TextStyle(fontSize: 11),
        ),
      ),
    );
  }
}
