import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/Core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

class NoParam {}
