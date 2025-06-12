abstract class Failure {
  final String message;
  const Failure(this.message);
}

class DefaultFailure extends Failure {
  const DefaultFailure([super.message = 'Erro no servidor']);
}
