import 'package:dartz/dartz.dart';
import 'package:qtec_video_player_app/domain/entities/app-error.dart';

abstract class Usecase<Type, Parms> {
  Future<Either<AppError, Type>> call(Parms parms);
}
