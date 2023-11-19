import 'dart:convert';

import 'package:synapsis_challange/domain/models/errors/error_message.dart';
import 'package:synapsis_challange/domain/repositories/base_repository.dart';

abstract class BaseUsecase<R extends BaseRepository> {
  R repository;

  ErrorMessage? error;

  BaseUsecase(this.repository);

  Future<ErrorMessage> mappingError(ErrorMessage? error, dynamic e) async {
    try {
      error = ErrorMessage.fromJson(jsonDecode(e.response.toString()));
      error.code = e.response.statusCode;
      return Future.value(error);
    } catch (e) {
      final errorDefault = ErrorMessage(
          code: error?.code,
          status: error?.status,
          message: error?.message,
          data: error?.data);
      return Future.value(errorDefault);
    }
  }

  void disposeVariable(){
    error = null;
  }
}
