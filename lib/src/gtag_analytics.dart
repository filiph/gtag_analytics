// Copyright (c) 2017, filiph. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
library gtag_analytics.google_analytics;

import 'package:meta/meta.dart';

import 'interop.dart';

/// Class encapsulating the methods for sending data to Analytics.
class GoogleAnalytics {
  static const String _event = 'event';

  static final Options _empty = new Options();

  /// If set to `true`, errors that stem from the `gtag` JavaScript function
  /// not being accessible (like when the developer forgets to add the
  /// measurement code to the HTML file, or when the measurement code isn't
  /// loaded yet) will be ignored.
  ///
  /// This is handy when you want to make sure the app keeps on trucking even
  /// when Analytics is unavailable.
  final bool failSilently;

  /// Create a new instance for tracking through Google Analytics, and set
  /// [failSilently].
  GoogleAnalytics({this.failSilently: false});

  /// Send a custom event.
  void sendCustom(String name, {String category, String label, int value}) {
    final options = new Options();
    if (category != null) {
      options.event_category = category;
    }
    if (label != null) {
      options.event_label = label;
    }
    if (value != null) {
      options.value = value;
    }

    _sendEvent(name, options);
  }

  /// Send an exception to Google Analytics.
  void sendException(String description, {@required bool fatal}) {
    _sendEvent(
        'exception', new Options(description: description, fatal: fatal));
  }

  /// Send a page view.
  void sendPageView() {
    _sendEvent('page_view', _empty);
  }

  /// Send a sign up event, with method (such as 'Facebook', 'email', or
  /// 'Google'.
  void sendSignUp({String method: 'N/A'}) {
    _sendEvent('sign_up', new Options(method: method));
  }

  /// The method doing the actual sending. Catches and discards the error
  /// that stems from the `gtag` JavaScript function being undefined.
  void _sendEvent(String eventName, Options options) {
    try {
      gtag(_event, eventName, options);
      // ignore: avoid_catching_errors
    } on NoSuchMethodError catch (e) {
      if (!failSilently) {
        throw new StateError('gtag function not found. Please make sure you '
            'include the Google Analytics script in your HTML. ($e)');
      }
    }
  }
}
