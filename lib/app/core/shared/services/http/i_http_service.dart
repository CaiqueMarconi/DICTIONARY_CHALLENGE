import 'helpers/params.dart';
import 'helpers/responses.dart';

abstract class IHttpService {
  Future<GetHttpServiceResponse<T>> get<T>(GetHttpServiceParam param);
  Future<PostHttpServiceResponse<T>> post<T>(PostHttpServiceParam param);
}
