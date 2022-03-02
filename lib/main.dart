import 'package:flutter_realm_log_web/common/app_conifg.dart';
import 'package:flutter_winner_app/flutter_winner_app.dart';

void main() {
  final app = WinnerApp(AppConfog());
  app.appMain(
    appInit: () async {},
  );
}
