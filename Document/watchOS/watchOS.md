### Device family

Simple code:
```swift
func watchOSDeviceFamily() {
    let family = Device.family()
    switch family {
    case .AppleWatch:
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
func watchOSDeviceModel() {
    let model = Device.model()
    print(model.identifier)
    switch model {
        /*** iPod ***/
    case .AppleWatch:
        print("Device is a \(model)")
    case .AppleWatchSeries1:
        print("Device is a \(model)")
    case .AppleWatchSeries2:
        print("Device is a \(model)")
    case .AppleWatchSeries3:
        print("Device is a \(model)")
    case .simulator(let model):
        print("Device is a \(model)")
    case .unknown:
        print("unknown Device.")
    }
}
```

### Device screen size

Simple code:
```swift
func watchOSDeviceSize() {
    let size = Device.size()
    switch size {
    case .size38mm:
        print("Device size: \(size.description)")
    case .size42mm:
        print("Device size: \(size.description)")
    case .unknown:
        print("Device size unknown.")
    }
}
```

## Helpers

### Model

Simple code:
```swift
func watchOSModelHelper() {
    let model = Device.model()
    let allWatchs = Device.Model.allWatchs
    if allWatchs.contains(model) {
        print("Current device belong to Apple Watch")
    }
    let allSimulatorWatchs = Device.Model.allSimulatorWatchs
    if allSimulatorWatchs.contains(model) {
        print("Current device belong to Apple Watch Simulator")
    }
}
```

### Size
You can use operator like `>`, `<`, `>=`, `<=`, `==`, `!=`

Simple code:
```swift
func watchOSSizeHelper() {
    let size = Device.size()

    if size > .size38mm {
        print("Your device screen is larger than 38mm")
    }

    if size < .size38mm {
        print("Your device screen is smaller than 38mm")
    }

    if size >= .size38mm {
        print("Your device screen is equal or larger than 38mm")
    }

    if size <= .size38mm {
        print("Your device screen is equal or smaller than 38mm")
    }

    if size == .size38mm {
        print("It's a 38mm screen")
    }

    if size != .size42mm {
        print("It's not 42mm screen")
    }
}
```