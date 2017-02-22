# PromiseKit CoreLocation Extensions ![Build Status]

This project adds promises to Apple’s CoreLocation framework.


# Example Usage

```swift
CLLocationManager.promise().last.then { location in

    // `last` is a Promise method where `T` conforms to `Collection`
    // with `CLLocationManager` you often only want one location, not
    // a series and the last one is the one you want.

    // If you want all of them, omit the `last`

    // will automatically request location permissions
    // determining which to request from your app’s
    // `Bundle.mainBundle`’s Info.plist
}
```


# Trivial Extensions

Since PromiseKit 5 we no longer provide trivial extensions, here are the ones you may be looking for:

```swift
firstly {
    Promise{ geocodeAddressDictionary(addressDictionary, completionHandler: $0.resolve) }.first
}.then { placemark in
    //
}
```

```objective-c
[AnyPromise promiseWithAdapterBlock:^(id resolve) {
    [self reverseGeocodeLocation:location completionHandler:resolve];
}];
```

## CocoaPods

```ruby
pod "PromiseKit/CoreLocation" ~> 4.0
```

The extensions are built into `PromiseKit.framework` thus nothing else is needed.


## Carthage

```ruby
github "PromiseKit/CoreLocation" ~> 1.0
```

The extensions are built into their own framework:

```swift
// swift
import PromiseKit
import PMKCoreLocation
```

```objc
// objc
@import PromiseKit;
@import PMKCoreLocation;
```


[Build Status]: https://travis-ci.org/PromiseKit/CoreLocation.svg?branch=master
