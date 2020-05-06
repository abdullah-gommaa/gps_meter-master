import 'package:get_it/get_it.dart';
import 'package:gpsmeter/core/services/authentication_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthenticationService>(AuthenticationService());
}