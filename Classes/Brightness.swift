//
//  Brightness.swift
//  Devices
//
//  Created by RockerHX on 2018/3/31.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


#if os(iOS)


extension Device {

    /// range: 0 - 1
    static public var brightness: Float {
        get {
            return UIScreen.main.brightness
        }
        set {
            UIScreen.main.brightness = newValue
        }
    }

}


#elseif os(OSX)


extension Device {

    public enum Brightness {

        public enum Level {
            case level_0
            case level_1
            case level_2
            case level_3
            case level_4
            case level_5
            case level_6
            case level_7
            case level_8
            case level_9
            case level_10
            case level_11
            case level_12
            case level_13
            case level_14
            case level_15
            case level_16
            /// range: 0 - 1
            case custom(Float)

            static fileprivate func `init`(value: Float) -> Level {
                switch value {
                case 0:             return .level_0
                case 0.1015625:     return .level_1
                case 0.168945313:   return .level_2
                case 0.239257813:   return .level_3
                case 0.309570313:   return .level_4
                case 0.375976563:   return .level_5
                case 0.44140625:    return .level_6
                case 0.506835938:   return .level_7
                case 0.571289063:   return .level_8
                case 0.629882813:   return .level_9
                case 0.688476563:   return .level_10
                case 0.736328125:   return .level_11
                case 0.77734375:    return .level_12
                case 0.8125:        return .level_13
                case 0.875:         return .level_14
                case 0.9375:        return .level_15
                case 1:             return .level_16
                default:            return .custom(value)
                }
            }

            fileprivate func value() -> Float {
                switch self {
                case .level_0:              return 0
                case .level_1:              return 0.1015625
                case .level_2:              return 0.168945313
                case .level_3:              return 0.239257813
                case .level_4:              return 0.309570313
                case .level_5:              return 0.375976563
                case .level_6:              return 0.44140625
                case .level_7:              return 0.506835938
                case .level_8:              return 0.571289063
                case .level_9:              return 0.629882813
                case .level_10:             return 0.688476563
                case .level_11:             return 0.736328125
                case .level_12:             return 0.77734375
                case .level_13:             return 0.8125
                case .level_14:             return 0.875
                case .level_15:             return 0.9375
                case .level_16:             return 1
                case .custom(let value):   return value
                }
            }

        }

        static public var level: Level {
            get {
                var brightness: Float = 0
                var iterator: io_iterator_t = 0
                if IOServiceGetMatchingServices(kIOMasterPortDefault, IOServiceMatching("IODisplayConnect"), &iterator) == kIOReturnSuccess {
                    var service: io_object_t = 1
                    while service != 0 {
                        service = IOIteratorNext(iterator)
                        IODisplayGetFloatParameter(service, 0, kIODisplayBrightnessKey as CFString, &brightness)
                        IOObjectRelease(service)
                    }
                }
                return Level(value: brightness)
            }
            set {
                var iterator: io_iterator_t = 0
                if IOServiceGetMatchingServices(kIOMasterPortDefault, IOServiceMatching("IODisplayConnect"), &iterator) == kIOReturnSuccess {
                    var service: io_object_t = 1
                    while service != 0 {
                        service = IOIteratorNext(iterator)
                        IODisplaySetFloatParameter(service, 0, kIODisplayBrightnessKey as CFString, newValue.value())
                        IOObjectRelease(service)
                    }
                }
            }
        }

    }

}


#endif

