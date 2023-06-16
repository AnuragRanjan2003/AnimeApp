class Resource {
  final dynamic data;
  final String? msg;
  const Resource(this.data, this.msg);

  bool isSuccess() => data!=null;


}


class Success extends Resource{
  final dynamic value;
  const Success(this.value) : super(value, null);
}

class Failure extends Resource {
  final String error;
  const Failure(this.error) : super(null,error);
}