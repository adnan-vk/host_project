import 'package:authentication/controller/authenticarion_provider/auth_provider.dart';
import 'package:authentication/controller/book_provider.dart';
import 'package:authentication/controller/bottom_provider.dart';
import 'package:authentication/controller/wishlist_provider.dart';
import 'package:authentication/service/firebase_options.dart';
import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => bookProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            textTheme:
                GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)),
        debugShowCheckedModeBanner: false,
        home: const WelcomePage(),
      ),
    );
  }
}
