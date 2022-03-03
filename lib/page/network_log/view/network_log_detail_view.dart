import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_realm_log_web/model/get_network_log_api_response.dart';
import 'package:flutter_winner_app/flutter_winner_app.dart';
import 'package:pretty_json/pretty_json.dart';

class NetworkLogDetailView extends StatelessWidget {
  final GetNetworkLogApiResponse response;
  const NetworkLogDetailView({
    Key? key,
    required this.response,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final success = response.response?.statusCode == 200;
    return SingleChildScrollView(
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
                    DateTime.fromMillisecondsSinceEpoch(response.startTime)
                        .toString(),
                  ),
                ),
                hiSpace(width: 10),
                SizedBox(
                  width: 40,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        color: success ? Colors.green : Colors.red,
                        child: Text(
                          response.response?.statusCode.toString() ?? "",
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
                    response.request?.method ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                hiSpace(width: 10),
                Text("${response.endTime - response.startTime}ms"),
              ],
            ),
            hiSpace(height: 10),
            _titltValue(
              "Url",
              "${response.request?.baseUrl ?? ""}${response.request?.path ?? ""}",
            ),
            hiSpace(height: 10),
            _titltValue(
              "Request Headers",
              prettyJson(jsonDecode(response.request?.headers ?? "{}")),
            ),
            _titltValue(
              "Request Extra",
              prettyJson(jsonDecode(response.request?.extra ?? "{}")),
            ),
            _titltValue(
              "Request Query Parameter",
              prettyJson(jsonDecode(response.request?.queryParameters ?? "")),
            ),
            _titltValue(
              "Response Type",
              response.request?.responseType ?? "",
            ),
            _titltValue(
              "Request Data",
              prettyJson(jsonDecode(response.request?.data ?? "{}")),
            ),
            _titltValue(
              "Response extra",
              prettyJson(jsonDecode(response.response?.extra ?? "{}")),
            ),
            _titltValue(
              "Response Message",
              response.response?.statusMessage ?? "",
            ),
            _titltValue(
              "Response Data",
              prettyJson(jsonDecode(response.response?.data ?? "{}")),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titltValue(String title, String value) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          hiSpace(height: 5),
          Text(
            value,
            style: const TextStyle(
              // color: Colors.grey,
              fontSize: 16,
            ),
          ),
          hiSpace(height: 5),
        ],
      ),
    );
  }
}
