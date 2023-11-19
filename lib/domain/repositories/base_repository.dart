import 'package:dio/dio.dart';
import 'package:synapsis_challange/data/api/dio_client.dart';

class BaseRepository{
  DioClient dioClient = DioClient(Dio());

  BaseRepository();
}