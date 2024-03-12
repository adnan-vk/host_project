// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:developer';
import 'dart:io';

import 'package:authentication/model/book_model.dart';
import 'package:authentication/service/book_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class bookProvider extends ChangeNotifier {
  final ImagePicker imagePicker = ImagePicker();
  final FirebaseStorage storage = FirebaseStorage.instance;

  File? pickedImage;
  String imageName = DateTime.now().microsecondsSinceEpoch.toString();
  String? downloadUrl;
  List<Bookmodel> searchlist = [];
  BookService bookservice = BookService();
  List<Bookmodel> allbooks = [];

  addBook(Bookmodel data) async {
    await bookservice.addProduct(data);
    getBook();
  }

  void getBook() async {
    allbooks = await bookservice.getAllBooks();
    notifyListeners();
  }

  void search(String value) {
    searchlist = allbooks
        .where((element) =>
            element.bookname!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  uploadImage(image) async {
    try {
      if (image != null) {
        downloadUrl = await bookservice.uploadImage(imageName, image);
        notifyListeners();
        log(downloadUrl!);
      } else {
        log('image is null');
      }
    } catch (e) {
      log("the new error is  $e");
      rethrow;
    }
    notifyListeners();
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
      log("Image picked");
      notifyListeners();
    }
  }
}
