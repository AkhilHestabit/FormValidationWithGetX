import 'package:flutter/material.dart';
import 'package:form_validation_with_getx/app/modules/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
      ),
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          margin: const EdgeInsets.only(top: 40, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Image.asset("images/app_logo_splash.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Welcome to GitX Example",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Email",
                        prefixIcon: const Icon(Icons.email)),
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    onSaved: (value) {
                      controller.email = value!;
                    },
                    validator: (value) {
                      return controller.validateEmail(value!);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: controller.passwordController,
                    onSaved: (value) {
                      controller.password = value!;
                    },
                    validator: (value){
                      return controller.validatePassword(value!);
                      },
                  ),const SizedBox(
                    height: 16,
                  ),
                  ConstrainedBox(constraints: BoxConstraints.tightFor(
                    width: context.width),
                   child: ElevatedButton(
                     style: ButtonStyle(
                       shape: MaterialStateProperty.all(RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20),
                       ),
                       ),backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
                       padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                     ),
                     child: const Text("Login", style: TextStyle(fontSize: 14, color: Colors.white),),
                     onPressed: (){
                       controller.checkLogin();
                     },
                   ),
                  ),
                  const SizedBox(height: 16,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
