
import 'package:get/get.dart';
import 'package:uber_udit/features/HomePage/homepage_view.dart';
import 'package:uber_udit/features/Routing/route_constant.dart';
import 'package:uber_udit/features/login/login_page_binding.dart';
import 'package:uber_udit/features/login/login_page_view.dart';
import '../HomePage/homepage_binding.dart';
import '../signuppage/signup_view.dart';
import '../signuppage/signup_binding.dart';


List<GetPage> getPage = [
  GetPage( 
    name: RouteConstant.loginpage,
     page: ()=> const LoginPageView(),
     binding: LoginPageBinding(),
     transition: Transition.rightToLeft,
     ),
     GetPage( 
    name: RouteConstant.signuppage,
     page: ()=> const SignUpPageView(),
     binding: SignUpPageBinding(),
     transition: Transition.rightToLeft,
     ),
       GetPage( 
    name: RouteConstant.homepage,
     page: ()=> const HomePageView(),
     binding: HomePageBinding(),
     transition: Transition.rightToLeft,
     ),
     
];

