### Device screen size helper

```swift
func iOSModelHelper() {
    let model = Device.model()
    let allPhones = Device.Model.allPhones
    if allPhones.contains(model) {
        print("Current device belong to iPhone ")
    }
    let allSimulatorPhones = Device.Model.allSimulatorPhones
    if allSimulatorPhones.contains(model) {
        print("Current device belong to iPhone Simulator")
    }
}
```