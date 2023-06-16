import 'package:flutter/material.dart';
import 'package:flutter_projects/services/authenticate.dart';
import 'package:flutter_projects/ui/TextInput/OutlineTextInput.dart';

import '../utils/resource.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Authenticate mAuth = Authenticate();
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                const Color(0xffedf0f6),
                const Color(0xffd0bbc5).withOpacity(0.5),
              ])),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Welcome!",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      color: Colors.black87,
                      fontWeight: FontWeight.bold)),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 30),
                child: Text(
                  "Register to Continue",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: OutlineTextInput(hint: "Email", controller: controller1),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: OutlineTextInput(
                    hint: "password",
                    controller: controller2,
                    obscureText: true),
              ),
              const SizedBox(height: 50),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: MediaQuery.sizeOf(context).width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: const Color(0xfffc6b68),
                    onPressed: () {
                      String email = controller1.value.text;
                      String pass = controller2.value.text;
                      Future<Resource> result =
                          mAuth.registerWithEmail(email, pass);
                      result.then((value) {
                        if (value.isSuccess()) {
                          print("${value.data}");
                        } else {
                          print("${value.msg}");
                        }
                      }).onError((error, stackTrace) {
                        print(error.toString());
                      });
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontStyle: FontStyle.normal),
                      ),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already a user?",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, 'login');
                      },
                      child: const Text(
                        "login",
                        style: TextStyle(fontSize: 16),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
