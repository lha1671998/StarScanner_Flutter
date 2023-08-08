import 'package:equatable/equatable.dart';

import '../../models/documents.dart';

abstract class DocumentState extends Equatable {
  const DocumentState();

  @override
  List<Object?> get props => [];
}

class InitialState extends DocumentState {}

class LoadedState extends DocumentState {
  final List<Documents> docLists;

  const LoadedState(this.docLists);

  @override
  List<Object?> get props => [docLists];
}
