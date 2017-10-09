# gtag_analytics

A library for Google Analytics tracking through the `gtag` function.

## Usage

[Add the `gtag` Google Analytics tracking code][gtag] to your HTML:

    <!-- Global Site Tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=GA_TRACKING_ID"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
  
      gtag('config', 'GA_TRACKING_ID');
    </script>

In Dart, import this package.

    import 'package:gtag_analytics/gtag_analytics.dart';

Create an instance of the `GoogleAnalytics` class:
    
    final ga = new GoogleAnalytics();

Use the instance to send data:

    ga.sendPageView();
    ga.sendException("Exception: $e", fatal: true);
    ga.sendSignUp(method: "email");
    ga.sendCustom("play_video");

[Read more][ga_docs] about these events and their fields in the official 
documentation.

[ga_docs]: https://developers.google.com/analytics/devguides/collection/gtagjs/events
[gtag]: https://support.google.com/analytics/answer/7476135

### Only throwing in development, not in production

While analytics is important, you probably don't want it to break your whole
app when something is wrong in the measurement code. And since calling out to
`gtag` can go wrong for a number of reasons (forgotten tracking snippet
in HTML, gtag not defined in time, etc.), this package provides 
a "keep on trucking" mode.

You can ignore errors by constructing the `GoogleAnalytics` class like this:

    final ga = new GoogleAnalytics(failSilently: true);

The more realistic approach is to use an environment variable to switch this
behavior on and off depending on whether the code is running in development or
in production mode:

    final inProduction =
          const String.fromEnvironment("production") == "true";
    final ga = new GoogleAnalytics(failSilently: inProduction);

Then make sure you're building your production code with `production=true`,
like this:

    pub build --define production=true

You could also go the other way around, and use something like 
`development=true`. That way, you won't accidentally deploy a version that fails
on Google Analytics when you forget to provide the `production=true` option
on `pub build`. 
(On the other hand, you might unknowingly be ignoring a valid error when you
forget to provide the `development=true` option in development on `pub serve`.)

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
