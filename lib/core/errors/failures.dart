abstract class Failure {
  final String message;
  final String? code;

  Failure(this.message, {this.code});
}

class ServerFailure extends Failure {
  ServerFailure(super.message, {super.code});
}

class CacheFailure extends Failure {
  CacheFailure(super.message, {super.code});
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message, {super.code});
}

class AuthFailure extends Failure {
  AuthFailure(super.message, {super.code});
}

class ValidationFailure extends Failure {
  ValidationFailure(super.message, {super.code});
}

class PermissionFailure extends Failure {
  PermissionFailure(super.message, {super.code});
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message, {super.code});
}
