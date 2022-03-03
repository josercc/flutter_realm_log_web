import 'package:flutter_realm_log_web/api/get_network_log_api.dart';
import 'package:flutter_realm_log_web/model/get_network_log_api_response.dart';
import 'package:flutter_winner_app/flutter_winner_app.dart';

class NetworkLogPageViewModel extends BaseViewModel {
  int _page = 1;
  int _pageCount = 10;

  List<GetNetworkLogApiResponse> _list = [];
  List<GetNetworkLogApiResponse> get list => _list;

  NetworkLogPageViewModel() {
    _getNetworkLogData();
  }

  Future<void> _getNetworkLogData() async {
    final api = GetNetworkLogApi(page: _page, pageCount: _pageCount);
    final model = await request(api: api);
    if (model == null) return;
    hiddenHUD();
    _list = model.list ?? [];
    notifyListeners();
  }
}
