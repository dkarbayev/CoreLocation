import CoreLocation.CLGeocoder
#if !COCOAPODS
import PromiseKit
#endif

/**
 To import the `CLGeocoder` category:

    use_frameworks!
    pod "PromiseKit/CoreLocation"

 And then in your sources:

    import PromiseKit
*/
extension CLGeocoder {
    /// Submits a reverse-geocoding request for the specified location.
    public func reverseGeocode(location: CLLocation) -> Promise<PMKPlacemark> {
        return firstly {
            PromiseKit.wrap{ reverseGeocodeLocation(location, completionHandler: $0) }
        }.then(on: nil) {
            Promise(PMKPlacemark($0))
        }
    }

    /// Submits a forward-geocoding request using the specified address dictionary.
    public func geocode(_ addressDictionary: [String: String]) -> Promise<PMKPlacemark> {
        return firstly {
            PromiseKit.wrap{ geocodeAddressDictionary(addressDictionary, completionHandler: $0) }
        }.then(on: nil) {
            Promise(PMKPlacemark($0))
        }
    }

    /// Submits a forward-geocoding request using the specified address string.
    public func geocode(_ addressString: String) -> Promise<PMKPlacemark> {
        return firstly {
            PromiseKit.wrap{ geocodeAddressString(addressString, completionHandler: $0) }
        }.then(on: nil) {
            Promise(PMKPlacemark($0))
        }
    }

    /// Submits a forward-geocoding request using the specified address string within the specified region.
    public func geocode(_ addressString: String, region: CLRegion?) -> Promise<PMKPlacemark> {
        return firstly {
            PromiseKit.wrap{ geocodeAddressString(addressString, in: region, completionHandler: $0) }
        }.then(on: nil) {
            Promise(PMKPlacemark($0))
        }
    }
}

// Xcode doesn't import CLError as Swift.Error (last checked Xcode 8.2)
//extension CLError: CancellableError {
//    public var isCancelled: Bool {
//        return self == .geocodeCanceled
//    }
//}

public class PMKPlacemark: CLPlacemark {
    public var allPlacemarks: [CLPlacemark]

    init(_ placemarks: [CLPlacemark]) {
        allPlacemarks = placemarks
        super.init(placemark: placemarks[0])
    }

    public required init?(coder: NSCoder) {  //FIXME
        allPlacemarks = []
        super.init(coder: coder)
    }
}
