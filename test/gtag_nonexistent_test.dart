// Copyright (c) 2017, filiph. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

@TestOn('browser')
import 'package:gtag_analytics/gtag_analytics.dart';
import 'package:test/test.dart';

void main() {
  group('gtag non-existent', () {
    group('fail allowed', () {
      GoogleAnalytics ga;

      setUp(() {
        ga = new GoogleAnalytics();
      });

      test('send pageview', () {
        expect(() => ga.sendPageView(), throwsStateError);
      });

      test('send exception', () {
        expect(() => ga.sendException('description', fatal: true),
            throwsStateError);
      });

      test('send signup', () {
        expect(() => ga.sendSignUp(method: 'email'), throwsStateError);
      });

      test('send custom', () {
        expect(() => ga.sendCustom('play_video'), throwsStateError);
      });
    });

    group('fail disallowed (failSilently)', () {
      GoogleAnalytics ga;

      setUp(() {
        ga = new GoogleAnalytics(failSilently: true);
      });

      test('send pageview', () {
        expect(() => ga.sendPageView(), returnsNormally);
      });

      test('send exception', () {
        expect(() => ga.sendException('description', fatal: true),
            returnsNormally);
      });

      test('send signup', () {
        expect(() => ga.sendSignUp(method: 'email'), returnsNormally);
      });

      test('send custom', () {
        expect(() => ga.sendCustom('play_video'), returnsNormally);
      });
    });
  });
}
