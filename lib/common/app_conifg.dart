import 'package:flutter/material.dart';
import 'package:flutter_realm_log_web/page/home/home_page.dart';
import 'package:flutter_winner_app/flutter_winner_app.dart';

class AppConfog extends WinnerAppConfig {
  @override
  Widget appHome(BuildContext context) {
    return const HomePage();
  }

  @override
  WinnerEnvironmentUrl get environmentUrl {
    return WinnerEnvironmentUrl(
      debug: "http://127.0.0.1:9090",
      profile: "http://10.10.57.133",
      release: "http://127.0.0.1",
    );
  }

  @override
  SentryHost get sentryHost {
    return SentryHost(
      debug:
          "https://c20774016ffa4879a7ad450824d577f9@o1052791.ingest.sentry.io/6238242",
      release:
          "https://01003455d0eb4963bf49a18d7de508ca@o1052791.ingest.sentry.io/6238244",
    );
  }
}
