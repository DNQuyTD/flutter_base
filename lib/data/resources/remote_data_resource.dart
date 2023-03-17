import 'package:time_tracker/data/resources/models/login_request.dart';
import 'package:time_tracker/data/resources/models/login_response.dart';

import '../../core/network.dart';

class RemoteDataResource {
  const RemoteDataResource(this.networkManager);

  final NetworkManager networkManager;

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await networkManager.request(
        RequestMethod.post, "login",
        data: request.toJson());

    return LoginResponse.fromJson(response as Map<String, dynamic>);
  }
}