import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_scanner/bloc/documents/documents_event.dart';
import 'package:star_scanner/bloc/documents/documents_state.dart';

import '../../image_picker_service.dart';
import '../../models/documents.dart';

class DocumentsBloc extends Bloc<DocumentEvent, DocumentState> {
  DocumentsBloc() : super(InitialState()) {
    on<AddDocumentEvent>(_addDocument);
    on<RemoveDocumentEvent>(_removeDocument);// Đăng ký sự kiện AddDocument và liên kết với hàm xử lý _addDocument
  }

  List<Documents> docLists = [];

  void _addDocument(AddDocumentEvent event, Emitter<DocumentState> emit) async {
    final imageFile = await ImagePickerService().pickCropImage(imageSource: event.imageSource);
    if (imageFile != null) {
      String documentName = generateDocumentName();
      String documentDate = generateDate();
      Documents newDocument = Documents(
        id: docLists.length + 1,
        image: imageFile,
        name: documentName,
        date: documentDate,
        page: 1,
      );
      docLists.add(newDocument);
      emit(LoadedState(List.from(docLists))); // Phát ra trạng thái LoadedState mới khi danh sách tài liệu được cập nhật
    }
  }


  void _removeDocument(RemoveDocumentEvent event, Emitter<DocumentState> emit) async {
    docLists.removeWhere((doc) => doc.id == event.docId);
    emit(LoadedState(List.from(docLists)));
  }

  String generateDocumentName() {
    DateTime now = DateTime.now();
    String formattedDate = '${now.year}-${now.month}-${now.day}';
    String formattedTime = '${now.hour}:${now.minute}:${now.second}';
    return 'Scan $formattedDate $formattedTime';
  }

  String generateDate() {
    DateTime now = DateTime.now();
    String formattedDate = '${now.year}-${now.month}-${now.day}';
    return formattedDate;
  }
}
