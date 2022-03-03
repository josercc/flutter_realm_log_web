import 'package:json_annotation/json_annotation.dart';
part 'get_network_log_api_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetNetworkLogApiResponse
    extends JsonConverter<GetNetworkLogApiResponse, Map<String, dynamic>> {
  /// 请求开始时间
  @JsonKey(defaultValue: 0)
  late int startTime;

  /// 请求结束时间
  @JsonKey(defaultValue: 0)
  late int endTime;

  GetNetworkLogApiResponseRequest? request;

  GetNetworkLogApiResponseResponse? response;

  @override
  GetNetworkLogApiResponse fromJson(Map<String, dynamic> json) {
    return _$GetNetworkLogApiResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson(GetNetworkLogApiResponse object) {
    return _$GetNetworkLogApiResponseToJson(object);
  }
}

@JsonSerializable()
class GetNetworkLogApiResponseRequest {
  /// 头信息
  @JsonKey(defaultValue: "")
  late String headers;

  /// 请求的域名
  @JsonKey(defaultValue: "")
  late String baseUrl;

  String? extra;

  @JsonKey(defaultValue: "")
  late String method;

  @JsonKey(defaultValue: "")
  late String path;

  String? queryParameters;

  String? responseType;

  String? data;

  static fromJson(Map<String, dynamic> json) {
    return _$GetNetworkLogApiResponseRequestFromJson(json);
  }

  toJson() {
    return _$GetNetworkLogApiResponseRequestToJson(this);
  }
}

@JsonSerializable()
class GetNetworkLogApiResponseResponse {
  String? data;
  String? extra;
  String? headers;
  @JsonKey(defaultValue: 0)
  late int statusCode;

  @JsonKey(defaultValue: "")
  late String statusMessage;

  static fromJson(Map<String, dynamic> json) {
    return _$GetNetworkLogApiResponseResponseFromJson(json);
  }

  toJson() {
    return _$GetNetworkLogApiResponseResponseToJson(this);
  }
}
