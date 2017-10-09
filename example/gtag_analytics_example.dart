// Copyright (c) 2017, filiph. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:gtag_analytics/gtag_analytics.dart';

void main() {
  final ga = new GoogleAnalytics();
  ga.sendCustom("choose_action", category: "play");
}
