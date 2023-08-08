import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class DocumentEvent extends Equatable {
  const DocumentEvent();

  @override
  List<Object?> get props => [];
}

class AddDocumentEvent extends DocumentEvent {
  final ImageSource imageSource;
  const AddDocumentEvent(this.imageSource);
  @override
  List<Object?> get props => [imageSource];
}

class RemoveDocumentEvent extends DocumentEvent {
  final int docId;
  const RemoveDocumentEvent(this.docId);
  @override
  List<Object?> get props => [this.docId];
}
