import 'dart:developer';

import 'package:authentication/controller/authenticarion_provider/auth_provider.dart';
import 'package:authentication/view/bottom_bar/bottom_bar.dart';
import 'package:authentication/view/phone/phone.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPageWidget {
  loginIcons(context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            await Provider.of<AuthenticationProvider>(context, listen: false)
                .googleSignIn();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const Bottom(),
              ),
              (route) => false,
            );
          },
          child: SizedBox(
            width: size.width * .08,
            height: size.width * .08,
            child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://cdn.iconscout.com/icon/free/png-256/free-google-1772223-1507807.png',
                )),
          ),
        ),
        SizedBox(
          width: size.width * .02,
        ),
        SizedBox(
          width: size.width * .08,
          height: size.width * .08,
          child: InkWell(
            onTap: () {
              Provider.of<AuthenticationProvider>(context, listen: false)
                  .gitHubSignIn(context);
              log('git is clicked');
            },
            child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/25/25231.png',
                )),
          ),
        ),
        SizedBox(
          width: size.width * .02,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhonePage(),
                ));
          },
          child: SizedBox(
            width: size.width * .08,
            height: size.width * .08,
            child: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://cdn-icons-png.freepik.com/256/100/100313.png')),
          ),
        ),
      ],
    );
  }
}
