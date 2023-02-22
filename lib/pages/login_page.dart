import 'package:flutter/material.dart';
import 'package:kickgo/utils/routes.dart';

final TextEditingController _cepController = TextEditingController();
final TextEditingController _ceppController = TextEditingController();

class LoginPage extends StatelessWidget {
  final _formKeyLogin = GlobalKey<FormState>();

  LoginPage({super.key});

  moveToHome(BuildContext context) {
    if (_formKeyLogin.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sending Message"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKeyLogin,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                    child: Image(
                      image: AssetImage("assets/images/logo_img.png"),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.6,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    "Welcome to KickGo",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 24,
                      color: Color(0xff8bc34a),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 16),
                    child: TextFormField(
                      controller: _ceppController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email cannot be empty";
                        } else if (!(value.contains('@') &&
                            (value.contains(".")))) {
                          return "Email is invalid";
                        }
                        return null;
                      },
                      obscureText: false,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide:
                                BorderSide(color: Color(0x00ffffff), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide:
                                BorderSide(color: Color(0x00ffffff), width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide:
                                BorderSide(color: Color(0x00ffffff), width: 1),
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff9f9d9d),
                          ),
                          filled: true,
                          fillColor: Color(0x21ffc107),
                          isDense: false,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          prefixIcon: Icon(Icons.mail,
                              color: Color(0xffff9800), size: 24)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 8) {
                          return "Password must be of atleast 8 Characters";
                        }
                        return null;
                      },
                      controller: _cepController,
                      obscureText: true,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              BorderSide(color: Color(0x00ffffff), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              BorderSide(color: Color(0x00ffffff), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide:
                              BorderSide(color: Color(0x00ffffff), width: 1),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff9f9d9d),
                        ),
                        filled: true,
                        fillColor: Color(0x21ffc107),
                        isDense: false,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        prefixIcon: Icon(Icons.lock,
                            color: Color(0xffff9800), size: 24),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 16),
                    child: MaterialButton(
                      onPressed: () => moveToHome(context),
                      color: Color(0xff8bc34a),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      textColor: Color(0xffffffff),
                      height: 40,
                      minWidth: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Don't Have an account?",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.registerRoute);
                            },
                            child: const Text(
                              "Sign Up",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xffff9800),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
