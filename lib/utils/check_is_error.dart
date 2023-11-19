import 'package:synapsis_challange/domain/models/errors/error_message.dart';

bool checkIsNotError(Map<dynamic, ErrorMessage?> result) {
  if (result.values.first != null) {
    return false;
  }
  return true;
}