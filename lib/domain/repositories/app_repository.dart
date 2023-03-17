import 'package:time_tracker/domain/entities/login_input.dart';
import 'package:time_tracker/domain/entities/login_output.dart';

abstract class AppRepository {
  Future<LoginOutput> loginWithGoogle(LoginInput input);
}