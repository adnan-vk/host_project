import 'package:authentication/controller/authenticarion_provider/auth_provider.dart';
import 'package:authentication/view/home_page/home_page.dart';
import 'package:authentication/view/otp_page/otp.dart';
import 'package:authentication/view/welcome_page/welcome_page.dart';
import 'package:authentication/widgets/snackbar_widget.dart';
import 'package:authentication/widgets/text_filed_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhonePage extends StatelessWidget {
  PhonePage({Key? key}) : super(key: key);

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pro = Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: textwidget.text(data: 'Enter Phone Number'),
        backgroundColor: Colors.orange,
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: size.height * .4,
                  width: size.width * .2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://smsala.com/wp-content/uploads/voice-otp-service.png'))),
                ),
                const SizedBox(
                  height: 20,
                ),
                textFormField().textformfield(
                    max: 13,
                    controller: pro.phoneController,
                    labeltext: "Phone Number",
                    onchange: pro.getOtp(pro.phoneController.text),
                    keytype: TextInputType.phone),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        try {
                          pro.getOtp(pro.phoneController.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpPage(),
                              ));
                          pro.clearControllers();
                          SnackBarWidget().showSuccessSnackbar(
                              context, "OTP Sended Successfully");
                        } catch (e) {
                          SnackBarWidget().showErrorSnackbar(
                              context, "pls enter valid number");
                        }
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(appcolor.orange),
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0))),
                    child: textwidget.text(
                        data: "Send OTP",
                        size: 18.0,
                        weight: FontWeight.bold,
                        color: appcolor.white)),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
