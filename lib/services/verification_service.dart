import 'package:http/http.dart' as http;

class VerificationService {

  Future<http.Response> verify(String email, int code) async{

    print("Email: ${email}, Code: ${code}");
    final response = await http.post(
      Uri.parse('https://demo.webdesigncompanyinbhiwadi.xyz/flutter-task/verification.php'),
      body: {"email": email, "verification_code": '$code'},
    );
    print("ver: ${response.body}");

    return response;
  }
}