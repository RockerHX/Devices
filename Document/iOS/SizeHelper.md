### Device screen size helper

```swift
func iOSSizeHelper() {
    let size = Device.size()

    if size > .screen4_7Inch {
        print("Your device screen is larger than 4.7 inch")
    }

    if size < .screen4_7Inch {
        print("Your device screen is smaller than 4.7 inch")
    }

    if size >= .screen4_7Inch {
        print("Your device screen is equal or larger than 4.7 inch")
    }

    if size <= .screen4_7Inch {
        print("Your device screen is equal or smaller than 4.7 inch")
    }
    
    if size == .screen4_7Inch {
        print("It's a 4.7 inch screen")
    }

    if size != .screen4_7Inch {
        print("It's not 4.7 inch screen")
    }

    if Device.isRetina() {
        print("It's a retina display")
    }
}
```