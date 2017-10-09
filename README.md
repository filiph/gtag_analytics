# gtag_analytics

A library for Google Analytics tracking through the `gtag` function.

## Usage

[Add the `gtag` Google Analytics tracking code][gtag] to your HTML:

    <!-- Global Site Tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-123456-42"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
  
      gtag('config', 'UA-123456-42');
    </script>

In Dart, import this package.

    import 'package:gtag_analytics/gtag_analytics.dart';
    
Create an instance of the `GoogleAnalytics` class:
    
    final ga = new GoogleAnalytics();
    
Or, if you want to ignore errors:

    final ga = new GoogleAnalytics(failSilently: true);

Use the instance to send data:

    ga.sendPageView();
    ga.sendException("Exception: $e", fatal: true);
    ga.sendSignUp(method: "email");
    ga.sendCustom("play_video");

[gtag]: https://support.google.com/analytics/answer/7476135

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
