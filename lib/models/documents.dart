import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Documents {
  late int id;
  XFile image;
  late String name;
  late String date;
  late int page;

  Documents(
      {required this.id,
      required this.image,
      required this.name,
      required this.date,
      required this.page});
}


