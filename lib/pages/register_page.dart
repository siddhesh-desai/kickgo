import 'package:flutter/material.dart';
import 'package:kickgo/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../utils/utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKeyRegister = GlobalKey<FormState>();

  bool isLoading = false; //For Spinner

  //Text Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  //Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: deprecated_member_use
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.reference();

  //For Password Visibility
  bool _obscureText = true; // initialize obscureText to true

  //Register Function
  Future<void> _signup() async {
    try {
      // Loading Begins
      setState(() {
        isLoading = true;
      });

      // Firebase Authentication
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim(),
      );

      //Adding user to Firebase Realtime Database
      User? user = userCredential.user;
      if (user != null) {
        // Save user data to Realtime Database
        await _databaseRef.child('users').child(user.uid).set({
          'name': _nameController.text.trim(),
          'email': _emailController.text.trim(),
        });
        // Navigate to home page on successful sign up
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
      }
    } on FirebaseAuthException catch (e) {
      //If Error
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        Utils().toastMsg('The password provided is too weak.'); //Show Toast
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
        Utils().toastMsg(
            'The account already exists for that email.'); //Show Toast
      }
    }

    //Stop Loading
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Align(
        alignment: Alignment.center,
        child: isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                    child: Image(
                      image: AssetImage("assets/images/logo_img.png"),
                      height: 200,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKeyRegister,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          child: Image(
                            image: AssetImage("assets/images/logo_img.png"),
                            height: 100,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text(
                            "Create New Account",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 24,
                              color: Color(0xff8bc34a),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 16),
                          child: TextFormField(
                            controller: _nameController,
                            obscureText: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Name cannot be empty";
                              }
                              return null;
                            },
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xff000000),
                            ),
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                    color: Color(0x00ffffff), width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                    color: Color(0x00ffffff), width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                    color: Color(0x00ffffff), width: 1),
                              ),
                              hintText: "Name",
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff9f9d9d),
                              ),
                              filled: true,
                              fillColor: const Color(0x21ffc107),
                              isDense: false,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              prefixIcon: const Icon(Icons.account_box,
                                  color: Color(0xffff9800), size: 22),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _emailController,
                          obscureText: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email Address cannot be empty";
                            } else if (!(value.contains('@') &&
                                value.contains('.'))) {
                              return "Invalid Email";
                            }
                            return null;
                          },
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  color: Color(0x00ffffff), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  color: Color(0x00ffffff), width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                  color: Color(0x00ffffff), width: 1),
                            ),
                            hintText: "Email Address",
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xff9f9d9d),
                            ),
                            filled: true,
                            fillColor: const Color(0x21ffc107),
                            isDense: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            prefixIcon: const Icon(Icons.mail,
                                color: Color(0xffff9800), size: 22),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: TextFormField(
                            controller: _passController,
                            obscureText: _obscureText,
                            textAlign: TextAlign.start,
                            validator: (value) {
                              if (value!.length < 8) {
                                return "Password must be of atleast 8 Characters";
                              }
                              return null;
                            },
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xff000000),
                            ),
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                    color: Color(0x00ffffff), width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                    color: Color(0x00ffffff), width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                    color: Color(0x00ffffff), width: 1),
                              ),
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff9f9d9d),
                              ),
                              filled: true,
                              fillColor: const Color(0x21ffc107),
                              isDense: false,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 12,
                              ),
                              prefixIcon: const Icon(Icons.lock,
                                  color: Color(0xffff9800), size: 22),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _obscureText =
                                        !_obscureText; // toggle the value of _obscureText on button press
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: const Color(0xffff9800),
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
                          child: MaterialButton(
                            onPressed: () async {
                              if (_formKeyRegister.currentState!.validate()) {
                                _signup();
                              }
                            },
                            color: const Color(0xff8bc34a),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            padding: const EdgeInsets.all(16),
                            textColor: const Color(0xffffffff),
                            height: 50,
                            minWidth: MediaQuery.of(context).size.width,
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
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
                                "Have an account?",
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
                                padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, MyRoutes.loginRoute);
                                  },
                                  child: const Text(
                                    "Sign In",
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
