class Response<T> {
  String? _message;
  T? _data;
  final ResponseStatus _status;

  String? get message => _message;
  T? get data => _data;
  ResponseStatus? get status => _status;

  Response.loading(this._message) : _status = ResponseStatus.loading;
  Response.completed(this._data) : _status = ResponseStatus.completed;
  Response.error(this._message) : _status = ResponseStatus.error;
}

enum ResponseStatus { loading, completed, error }
