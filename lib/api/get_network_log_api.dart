import 'package:flutter_realm_log_web/common/app_model.dart';
import 'package:flutter_realm_log_web/model/get_network_log_api_response.dart';
import 'package:flutter_winner_app/flutter_winner_app.dart';

class GetNetworkLogApi
    extends Api<GetNetworkLogApiResponse, AppModel<GetNetworkLogApiResponse>> {
  final int page;
  final int pageCount;

  GetNetworkLogApi({
    required this.page,
    required this.pageCount,
  });
  @override
  GetNetworkLogApiResponse get converter => GetNetworkLogApiResponse();

  @override
  AppModel<GetNetworkLogApiResponse> get model =>
      AppModel<GetNetworkLogApiResponse>();

  @override
  String get path => "/network_log";

  @override
  Map<String, dynamic> get params => {"per": pageCount, "page": page};
}
