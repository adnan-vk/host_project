import 'package:authentication/view/profile_page/about/widgets.dart';
import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:authentication/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About BookStore'),
        backgroundColor: appcolor.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget().text(
                data: 'Description:',
                size: 20.0,
                weight: FontWeight.bold,
                color: appcolor.orange),
            const SizedBox(height: 10.0),
            TextWidget().text(
              data:
                  'BookStore is a mobile application designed to provide users with a convenient platform for purchasing books online. With a user-friendly interface and a wide selection of books, users can easily browse, search, and purchase their favorite titles from the comfort of their own device.',
              size: 16.0,
            ),
            const SizedBox(height: 20.0),
            TextWidget().text(
                data: 'Key Features:',
                size: 20.0,
                weight: FontWeight.bold,
                color: appcolor.orange),
            const SizedBox(height: 10.0),
            buildFeature('Browse and Search',
                'Users can browse through a vast collection of books categorized by genres, authors, or topics. They can also search for specific books using keywords.'),
            buildFeature('Book Details',
                'Each book listing includes detailed information such as title, author, description, price, and cover image. Users can view these details to make informed purchasing decisions.'),
            buildFeature('Shopping Cart',
                'Users can add books to their shopping cart for later purchase. They can review the items in their cart, adjust quantities, and proceed to checkout when ready.'),
            const SizedBox(height: 20.0),
            const Text(
              'Mission Statement:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '"Our mission is to provide book lovers with a seamless and enjoyable shopping experience by offering a diverse selection of books, convenient purchasing options, and exceptional customer service."',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
