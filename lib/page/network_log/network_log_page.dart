import 'package:flutter/material.dart';
import 'package:flutter_realm_log_web/model/get_network_log_api_response.dart';
import 'package:flutter_realm_log_web/page/network_log/view/network_log_detail_view.dart';
import 'package:flutter_realm_log_web/page/network_log/view_model/network_log_page_view_model.dart';
import 'package:flutter_winner_app/flutter_winner_app.dart';
import 'package:provider/provider.dart';

class NetworkLogPage extends StatefulWidget {
  const NetworkLogPage({Key? key}) : super(key: key);

  @override
  State<NetworkLogPage> createState() => _NetworkLogPageState();
}

class _NetworkLogPageState
    extends BasePage<NetworkLogPage, NetworkLogPageViewModel>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return KeepAliveWrapper(
      child: ChangeNotifierProvider.value(
        value: viewModel,
        builder: (context, child) {
          final list = context
              .select<NetworkLogPageViewModel, List<GetNetworkLogApiResponse>>(
            ((value) => value.list),
          );
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final model = list[index];
              final success = model.response?.statusCode == 200;
              return InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return NetworkLogDetailView(response: model);
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(15),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 180,
                            child: Text(
                              DateTime.fromMillisecondsSinceEpoch(
                                      model.startTime)
                                  .toString(),
                            ),
                          ),
                          hiSpace(width: 10),
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  color: success ? Colors.green : Colors.red,
                                  child: Text(
                                    model.response?.statusCode.toString() ?? "",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          hiSpace(width: 10),
                          SizedBox(
                            width: 50,
                            child: Text(
                              model.request?.method ?? "",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          hiSpace(width: 10),
                          Text("${model.endTime - model.startTime}ms"),
                        ],
                      ),
                      hiSpace(height: 10),
                      _titleValue(
                        "Uri",
                        "${model.request?.baseUrl ?? ""}${model.request?.path ?? ""}",
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Row _titleValue(String title, String value) {
    return Row(
      children: [
        Text(title),
        hiSpace(width: 10),
        Expanded(child: Text(value)),
      ],
    );
  }

  @override
  NetworkLogPageViewModel create() {
    return NetworkLogPageViewModel();
  }

  @override
  Widget buildPage(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  bool get wantKeepAlive => true;
}
