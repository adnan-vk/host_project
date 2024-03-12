import 'package:authentication/controller/authenticarion_provider/auth_provider.dart';
import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:authentication/widgets/snackbar_widget.dart';
import 'package:authentication/widgets/text_filed_widget.dart';
import 'package:authentication/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatelessWidget {
  OtpPage({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AuthenticationProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify OTP'),
        backgroundColor: Colors.orange,
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: size.height * .3,
                decoration: const BoxDecoration(),
              ),
              textFormField().textformfield(
                  max: 6,
                  controller: pro.otpController,
                  labeltext: "OTP",
                  type: "OTP",
                  onchange: pro.verifyOtp(pro.otpController.text,context),
                  keytype: TextInputType.number),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      try {
                        pro.verifyOtp(pro.otpController.text,context);
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const Bottom(),
                        //     ),
                        //     (route) => false);
                        // SnackBarWidget()
                        //     .showSuccessSnackbar(context, "OTP validated");
                      } catch (e) {
                        SnackBarWidget()
                            .showErrorSnackbar(context, "Invalid OTP");
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                  ),
                  child: TextWidget().text(
                      data: 'Verify OTP',
                      size: 18.0,
                      weight: FontWeight.bold,
                      color: appcolor.white)),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
