import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 55.0, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login to your account",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const Row(
                children: [
                  Text(
                    "Hello ,welcome back !",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                  Icon(Icons.front_hand_outlined, color: Colors.yellow)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    // child: Image(
                    //   image: AssetImage('assets/logo3.png'),
                    //   height: 200,
                    //   width: 200,
                    // ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                child: Form(
                  key: controller.loginKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 20, bottom: 20),
                         child: TextFormField(
                              controller: controller.emailController,
                              obscureText: controller.isSet.value,
                              decoration: InputDecoration(
                                  label: const Text("Email"),
                                  prefixIcon:const Icon(Icons.lock),
                                  hintText: "Enter Email",
                                  hintStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.elliptical(12, 12)),
                                  ),
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  suffixIcon:const Icon(Icons.email),
                                 ),
                                 
                                           validator: (value) {
                                               if (value == '') {
                          return 'Please enter Email';
                                               }
                                               return null;
                                             },
                            ),
                       ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Obx(
                          () => TextFormField(
                            controller: controller.passWordController,
                            obscureText: controller.isSet.value,
                            decoration: InputDecoration(
                                label: const Text("Password"),
                                prefixIcon:const Icon(Icons.lock),
                                hintText: "Enter password",
                                hintStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.elliptical(12, 12)),
                                ),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.isSet.value =
                                      !controller.isSet.value;
                                    },
                                    icon: controller.isSet.value
                                        ? const Icon(Icons.lock)
                                        : const Icon(Icons.lock))),
                                         validator: (value) {
                      if (value!.length < 6 || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                          ),
                        ),
                      ),
                     
                      Center(
                        child: SizedBox(
                          width: 400,
                          child: ElevatedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                 controller.checkValidation();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo.shade900,
                                fixedSize:const Size(400, 50)
                              ),
                              child: const Text("Log in",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25))),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 25.0, bottom: 23),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Divider(
                              indent: 5,
                              endIndent: 5,
                            )),
                            Text("or Login with", style: TextStyle(fontSize: 14)),
                            Expanded(
                                child: Divider(
                              indent: 5,
                              endIndent: 5,
                            )),
                          ],
                        ),
                      ),
                     
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
                            ),
                            InkWell(
                                onTap: () {
                                 // Get.toNamed(RouteConstant.signuppage);
                                },
                                child: (const Text(" Sign Up",
                                    style: TextStyle(color: Colors.blue,fontSize: 16),
                                    textAlign: TextAlign.start)))
                          ],
                        ),
                      ),
                     const SizedBox(height: 20,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}