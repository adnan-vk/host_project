// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison

import 'dart:io';
import 'package:authentication/controller/book_provider.dart';
import 'package:authentication/model/book_model.dart';
import 'package:authentication/widgets/text_filed_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categorycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<bookProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    pickImage(context);
                  },
                  child: Consumer<bookProvider>(
                    builder: (context, value, child) => CircleAvatar(
                      backgroundImage: value.pickedImage != null
                          ? FileImage(value.pickedImage!)
                          : null,
                      radius: 70,
                      child: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              textFormField().textformfield(
                  controller: nameController, labeltext: "Book Name"),
              const SizedBox(height: 20),
              textFormField().textformfield(
                  controller: authorController, labeltext: "Author"),
              const SizedBox(height: 20),
              textFormField().textformfield(
                  controller: categorycontroller, labeltext: "Category"),
              const SizedBox(height: 20),
              textFormField().textformfield(
                  controller: descriptionController, labeltext: "Description"),
              const SizedBox(height: 20),
              textFormField().textformfield(
                  keytype: TextInputType.number,
                  controller: priceController,
                  labeltext: "Price"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  addData(context);
                  pro.uploadImage(pro.downloadUrl);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addData(context) async {
    final getProvider = Provider.of<bookProvider>(context, listen: false);
    final getwidgetProvider = Provider.of<bookProvider>(context, listen: false);
    await getProvider.uploadImage(File(getwidgetProvider.pickedImage!.path));

    final product = Bookmodel(
        bookname: nameController.text,
        author: authorController.text,
        description: descriptionController.text,
        price: int.parse(priceController.text),
        category: categorycontroller.text,
        wishlist: [],
        image: getProvider.downloadUrl);
    getProvider.addBook(product);
    Navigator.pop(context);
  }

  Future<void> pickImage(BuildContext context) async {
    final pro = Provider.of<bookProvider>(context, listen: false);
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pro.getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
