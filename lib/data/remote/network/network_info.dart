import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl({required this.internetConnectionChecker});

  final InternetConnectionChecker internetConnectionChecker;

  @override
  Future<bool> isConnected() => internetConnectionChecker.hasConnection;
}
