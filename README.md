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

[Read more][ga_docs] about these events and their fields in the official 
documentation.

[ga_docs]: https://developers.google.com/analytics/devguides/collection/gtagjs/events
[gtag]: https://support.google.com/analytics/answer/7476135

## Testing

Most of the functionality lives in the Google Analytics JavaScript code,
but there are some tests that cover the wrapper. They will only work
in a browser, so you'll have to run them with the `-p` option, like
this:

    pub run test -p chrome

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].
[Pull requests][pr] welcome.

[tracker]: https://github.com/filiph/gtag_analytics/issues
[pr]: https://github.com/filiph/gtag_analytics/pulls
