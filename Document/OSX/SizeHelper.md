### Device screen size helper

```swift
func OSXSizeHelper() {
    let size = Device.size()

    if size > .screen15Inch {
        print("Your device screen is larger than 15 inch")
    }

    if size < .screen15Inch {
        print("Your device screen is smaller than 15 inch")
    }

    if size >= .screen15Inch {
        print("Your device screen is equal or larger than 15 inch")
    }

    if size <= .screen15Inch {
        print("Your device screen is equal or smaller than 15 inch")
    }

    if size == .screen15Inch {
        print("It's a 15 inch screen")
    }

    if size != .screen17Inch {
        print("It's not 17 inch screen")
    }

    if Device.isRetina() {
        print("It's a retina display")
    }
}
```