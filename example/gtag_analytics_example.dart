// Copyright (c) 2017, filiph. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:gtag_analytics/gtag_analytics.dart';

void main() {
  final inProduction =
      const String.fromEnvironment("production") == "true";
  final ga = new GoogleAnalytics(failSilently: inProduction);
  ga.sendCustom("choose_action", category: "play");
}
