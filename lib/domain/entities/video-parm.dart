import 'package:equatable/equatable.dart';

class VideoParm extends Equatable {
  final int no;

  const VideoParm({required this.no});

  @override
  List<Object?> get props => [no];
}
