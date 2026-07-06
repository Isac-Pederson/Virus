import 'package:flutter_riverpod/flutter_riverpod.dart';


final loginViewModelProvider = NotifierProvider<LoginViewModel, LoginState>(
  LoginViewModel.new,
);

class LoginViewModel extends Notifier<LoginState> {
  @override
  LoginState build() => const LoginState();

  void toggleMode() {
    state = state.copyWith(isSignup: !state.isSignup, clearError: true);
  }

  void toggleRememberMe(bool? value) {
    state = state.copyWith(rememberMe: value ?? false);
  }

  String? _validate(String email, String password) {
    if (email.isEmpty || !email.contains('@')) {
      return 'Enter a valid email address';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> submit(String email, String password) async {
    final validationError = _validate(email, password);
    if (validationError != null) {
      state = state.copyWith(errorMessage: validationError);
      return;
    }

    state = state.copyWith(isLoading: true, clearError: true);

    try {
      // TODO: wire to C# server once auth endpoint exists, e.g.
      // if (state.isSignup) {
      //   await ref.read(authServiceProvider).signup(email, password);
      // } else {
      //   await ref.read(authServiceProvider).login(email, password);
      // }
      throw UnimplementedError('Auth backend not connected yet');
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Something went wrong. Please try again.',
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

//super simple so I'm not using freezed here
class LoginState {
  final bool isSignup;
  final bool rememberMe;
  final bool isLoading;
  final String? errorMessage;

  const LoginState({
    this.isSignup = false,
    this.rememberMe = false,
    this.isLoading = false,
    this.errorMessage,
  });

  LoginState copyWith({
    bool? isSignup,
    bool? rememberMe,
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return LoginState(
      isSignup: isSignup ?? this.isSignup,
      rememberMe: rememberMe ?? this.rememberMe,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}