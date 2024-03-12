import 'package:authentication/model/book_model.dart';
import 'package:authentication/service/book_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  BookService bookService = BookService();

  Future<void> wishlistCliscked(String id, bool status) async {
    await bookService.wishlistClicked(id, status);
    notifyListeners();
  }

  bool wishlistCheck(Bookmodel book) {
    final currentuser = FirebaseAuth.instance.currentUser;
    final user = currentuser!.email ?? currentuser.phoneNumber;
    return !book.wishlist.contains(user);
  }
}
