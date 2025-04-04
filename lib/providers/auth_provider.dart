import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/auth_service.dart';

part 'auth_provider.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) {
  return AuthService();
}

@riverpod
class Auth extends _$Auth {
  @override
  Future<bool> build() async {
    final authService = ref.watch(authServiceProvider);
    return await authService.isAuthenticated();
  }

  Future<bool> isAuthenticated() async {
    final authService = ref.watch(authServiceProvider);
    return await authService.isAuthenticated();
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();

    try {
      final authService = ref.read(authServiceProvider);
      await authService.signIn(email, password);
      state = const AsyncValue.data(true);
    } catch (e, stack) {
      
      state = AsyncValue.error(e, stack);
      rethrow; 
    }
  }

  Future<void> signUp(String email, String password, String firstName) async {
    state = const AsyncValue.loading();

    try {
      final authService = ref.read(authServiceProvider);
      await authService.signUp(email, password, firstName);
      await signIn(email, password);
    } catch (e, stack) {
      
      state = AsyncValue.error(e, stack);
      rethrow; 
    }
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();

    try {
      final authService = ref.read(authServiceProvider);
      await authService.signOut();
      state = const AsyncValue.data(false);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
