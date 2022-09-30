import 'package:flutter/material.dart';
import 'package:practice_provider/provider/authprovider.dart';
import 'package:provider/provider.dart';

class LoginWithApi extends StatefulWidget {
  const LoginWithApi({super.key});

  @override
  State<LoginWithApi> createState() => _LoginWithApiState();
}

class _LoginWithApiState extends State<LoginWithApi> {
  final TextEditingController _emilcontroller = TextEditingController();

  final TextEditingController _passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginprovider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emilcontroller,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passcontroller,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                loginprovider.login(
                    context, _emilcontroller.text, _passcontroller.text);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.red),
                child: Center(
                  child: loginprovider.loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          textAlign: TextAlign.center,
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
