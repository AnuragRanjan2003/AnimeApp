import 'package:flutter/material.dart';
import 'package:flutter_projects/services/authenticate.dart';
import 'package:flutter_projects/ui/TextInput/OutlineTextInput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<StatefulWidget> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  Authenticate mAuth = Authenticate();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {

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
              const Text("Hello Again!",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      color: Colors.black87,
                      fontWeight: FontWeight.bold)),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 30),
                child: Text(
                  "Welcome back you've\n been missed",
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
                      _isLoading = true;
                      setState(() {});
                      String email = controller1.value.text;
                      String pass = controller2.value.text;
                      var result = mAuth.signInEmail(email, pass);
                      result.then((value) {
                        _isLoading = false;
                        if (value.isSuccess())
                          print("done");
                        else {
                          print("${value.msg}");
                          showSnackBar(value.msg!);
                        }
                        setState(() {});
                      }).onError((error, stackTrace) {
                        _isLoading = false;
                        showSnackBar(error.toString());
                        setState(() {});
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "login",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontStyle: FontStyle.normal),
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 30),
                              height: 20,
                              width: 20,
                              child: Visibility(
                                visible: _isLoading,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.0,
                                ),
                              ))
                        ],
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
                    "New User?",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'register');
                      },
                      child: const Text(
                        "Register",
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

  @override
  void dispose() {
  controller1.dispose();
  controller2.dispose();
  }

  void showSnackBar(String msg) {
    final sb = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(sb);
  }
}
