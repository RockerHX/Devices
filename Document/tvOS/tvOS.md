### Device family

Simple code:
```swift
func tvOSDeviceFamily() {
    let family = Device.family()
    switch family {
    case .AppleTV:
        print("Device belong to \(family) family")
    case .simulator:
        print("Device belong to \(family) family")
    case .unknown:
        print("unknown Device.")
    }
}
```

### Device model

Simple code:
```swift
func tvOSDeviceModel() {
    let model = Device.model()
    print(model.identifier)
    switch model {
    case .AppleTV4Gen:
        print("Device is a \(model)")
    case .AppleTV4K:
        print("Device is a \(model)")
    case .simulator(let model):
        print("Device is a \(model)")
    case .unknown:
        print("unknown Device.")
    }
}
```

## Helpers

### Model

Simple code:
```swift
func tvOSModelHelper() {
    let model = Device.model()
    let allTVs = Device.Model.allTVs
    if allTVs.contains(model) {
        print("Current device belong to Apple TV ")
    }
}
```