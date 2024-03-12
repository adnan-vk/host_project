// ignore_for_file: avoid_types_as_parameter_names

import 'package:authentication/controller/book_provider.dart';
import 'package:authentication/controller/wishlist_provider.dart';
import 'package:authentication/model/book_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
        backgroundColor: Colors.orange.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer2<WishlistProvider, bookProvider>(
              builder: (context, wishlistProvider, bookProvider, child) {
                final wishlistItems = checkUser(wishlistProvider, bookProvider);
                return Expanded(
                  child: ListView.builder(
                    itemCount: wishlistItems.length,
                    itemBuilder: (context, index) {
                      final item = wishlistItems[index];
                      return ListTile(
                        title: Text(item.bookname.toString()),
                        subtitle: Text('Author: ${item.author}'),
                        trailing: Text('₹ ${item.price}'),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  List<Bookmodel> checkUser(
      WishlistProvider wishlistProvider, bookProvider bookProvider) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return [];
    }
    final user = currentUser.email ?? currentUser.phoneNumber;
    List<Bookmodel> myBooks = [];
    for (var book in bookProvider.allbooks) {
      if (book.wishlist.contains(user)) {
        myBooks.add(book);
      }
    }
    return myBooks;
  }
}
