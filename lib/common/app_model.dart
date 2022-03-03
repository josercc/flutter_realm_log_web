import 'package:flutter_realm_log_web/model/page_model.dart';
import 'package:flutter_winner_app/flutter_winner_app.dart';
import 'package:json_annotation/json_annotation.dart';

class AppModel<T extends JsonConverter> extends WinnerBaseModel<T> {
  PageModel? pageModel;
  @override
  void customParseData(
    Map<String, dynamic> data,
    Api<JsonConverter, BaseModel> api,
  ) {
    isSuccess = data["success"] as bool? ?? false;
    message = data["message"] as String? ?? "";
    code = data["code"] as int? ?? -1;
    final result = data["data"];
    if (result is List) {
      List<T> list = [];
      for (var model in result) {
        list.add(api.converter.fromJson(model));
      }
      this.list = list;
    } else if (result is Map) {
      this.data = api.converter.fromJson(result);
    } else {
      this.data = DefaultJsonConverter<T>().fromJson(result);
    }

    final page = data["page"];
    if (page is Map<String, dynamic>) {
      pageModel = PageModel().fromJson(page);
    }
  }
}
