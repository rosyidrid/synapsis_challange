import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoint{
  String? baseUrl = dotenv.env["BASE_URL"];
}