import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:mobile_hris/controllers/auth_ctrl.dart';
import 'package:mobile_hris/core/constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthCtrl>(
      init: AuthCtrl(),
      builder: (authCtrl) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    child: SvgPicture.asset(
                      'assets/pana.svg',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Hello,\nWelcome Back !',
                    textAlign: TextAlign.center,
                    textScaler:
                        TextScaler.linear(ScaleSize.textScaleFactor(context)),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Let's sign you in",
                    textScaler:
                        TextScaler.linear(ScaleSize.textScaleFactor(context)),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 32),
                  TextField(
                    onChanged: (value) => authCtrl.setEmail(value),
                    decoration: InputDecoration(
                      labelText: 'Enter Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    onChanged: (value) => authCtrl.setPassword(value),
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle forgot password
                        Get.snackbar('Coming soon', '....');
                      },
                      child: Text('Forgot password?'),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      // Handle login
                      await authCtrl.login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: authCtrl.isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            'Login',
                            textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(context)),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
