import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final String message;
  final AppErrorType appErrorType;

  const AppError({required this.message, required this.appErrorType});

  @override
  List<Object?> get props => [appErrorType];
}

enum AppErrorType { api, database, network }
