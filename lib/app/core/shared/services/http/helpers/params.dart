enum HttpResponseType { json, bytes }

class GetHttpServiceParam {
  final String url;
  final HttpResponseType responseType;
  final Map<String, dynamic>? data;
  final Map<String, dynamic>? headers;
  final String? contentType;

  const GetHttpServiceParam({
    required this.url,
    this.data,
    this.headers,
    this.contentType,
    this.responseType = HttpResponseType.json,
  });
}

class PostHttpServiceParam {
  final String url;
  final Map<String, dynamic>? params;
  final Map<String, dynamic> data;
  final Map<String, dynamic>? headers;
  final HttpResponseType responseType;
  final String? contentType;

  const PostHttpServiceParam({
    required this.url,
    required this.data,
    this.params,
    this.contentType,
    this.headers,
    this.responseType = HttpResponseType.json,
  });
}

class DeleteHttpServiceParam {
  final String url;
  final HttpResponseType responseType;
  final Map<String, dynamic> data;
  final Map<String, dynamic> headers;
  final String contentType;

  const DeleteHttpServiceParam({
    required this.url,
    required this.data,
    required this.headers,
    required this.contentType,
    this.responseType = HttpResponseType.json,
  });
}
