import 'dart:convert';

import 'package:http/http.dart' as http;

class RegisterService {
  Future<http.Response> register(String name, String email, String mobile, int course, int subCourse) async{

    print(subCourse);
    final response = await http.post(
      Uri.parse('https://demo.webdesigncompanyinbhiwadi.xyz/flutter-task/signup.php'),
      body: {'name': name, 'email': email, 'mobile': mobile, 'course': "$course", 'sub_course' : "$subCourse"},
    );
    print("reg: ${response.body}");

    return response;
  }
  Future<http.Response> fetchSubCourses(int course) async {

    print("api id $course");
    final response = await http.post(
      Uri.parse(
          "https://demo.webdesigncompanyinbhiwadi.xyz/flutter-task/sub-courses.php"),
      body: {'course': "$course"},
    );

    print("sub body${response.body}");
    return response;

  }

  Future<http.Response> fetchCourses() async {

    final response = await http.get(Uri.parse(
        "https://demo.webdesigncompanyinbhiwadi.xyz/flutter-task/courses.php")
    );

    print(response.body);
    return response;

  }
}