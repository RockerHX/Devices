//
//  Size.swift
//  Devices
//
//  Created by RockerHX on 2018/3/23.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


extension Device {

    public enum Size: Int, Comparable {

        case unknown = 0

        #if os(iOS)

        case screen3_5Inch
        case screen4Inch
        case screen4_7Inch
        case screen5_5Inch
        case screen5_8Inch
        case screen6_5Inch
        case screen7_9Inch
        case screen9_7Inch
        case screen10_5Inch
        case screen12_9Inch

        #elseif os(OSX)

        case screen11Inch
        case screen12Inch
        case screen13Inch
        case screen15Inch
        case screen17Inch
        case screen20Inch
        case screen21_5Inch
        case screen24Inch
        case screen27Inch

        #elseif os(watchOS)
        case size38mm
        case size40mm
        case size42mm
        case size44mm

        #endif

        static public func > (lhs: Size, rhs: Size) -> Bool {
            return lhs.rawValue > rhs.rawValue
        }

        static public func < (lhs: Size, rhs: Size) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }

        static public func >= (lhs: Size, rhs: Size) -> Bool {
            return lhs.rawValue >= rhs.rawValue
        }

        static public func <= (lhs: Size, rhs: Size) -> Bool {
            return lhs.rawValue <= rhs.rawValue
        }

        static public func == (lhs: Size, rhs: Size) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }

        static public func != (lhs: Size, rhs: Size) -> Bool {
            return lhs.rawValue != rhs.rawValue
        }

    }

}


// MARK: - CustomStringConvertible -
extension Device.Size: CustomStringConvertible {

    public var description: String {
        return identifier
    }

    public var identifier: String {
        #if os(iOS)
        switch self {
        case .screen3_5Inch:    return "3.5 inch"
        case .screen4Inch:      return "4 inch"
        case .screen4_7Inch:    return "4.7 inch"
        case .screen5_5Inch:    return "5.5 inch"
        case .screen5_8Inch:    return "5.8 inch"
        case .screen6_5Inch:    return "6.5 inch"
        case .screen7_9Inch:    return "7.9 inch"
        case .screen9_7Inch:    return "9.7 inch"
        case .screen10_5Inch:   return "10.5 inch"
        case .screen12_9Inch:   return "12.9 inch"
        case .unknown:          return "unknown"
        }
        #elseif os(OSX)
        switch self {
        case .screen11Inch:     return "11 inch"
        case .screen12Inch:     return "12 inch"
        case .screen13Inch:     return "13 inch"
        case .screen15Inch:     return "15 inch"
        case .screen17Inch:     return "17 inch"
        case .screen20Inch:     return "20 inch"
        case .screen21_5Inch:   return "21.5 inch"
        case .screen24Inch:     return "24 inch"
        case .screen27Inch:     return "27 inch"
        case .unknown:          return "unknown"
        }
        #elseif os(tvOS)
        return  "unknown"
        #elseif os(watchOS)
        switch self {
        case .size38mm:         return "38mm"
        case .size40mm:         return "40mm"
        case .size42mm:         return "42mm"
        case .size44mm:         return "44mm"
        case .unknown:          return "unknown"
        }
        #endif
    }
}


#if os(iOS)


import UIKit


// MARK: - Size Methods -
extension Device {

    static public func size() -> Size {
        let width: Double = Double(UIScreen.main.bounds.width)
        let height: Double = Double(UIScreen.main.bounds.height)
        let screenHeight: Double = max(width, height)

        switch screenHeight {
        case 480:
            return .screen3_5Inch
        case 568:
            return .screen4Inch
        case 667:
            return (UIScreen.main.scale == 3.0) ? .screen5_5Inch : .screen4_7Inch
        case 736:
            return .screen5_5Inch
        case 812:
            return .screen5_8Inch
        case 896:
            return .screen6_5Inch
        case 1024:
            switch model() {
            case .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4:
                return .screen7_9Inch
            case .iPadPro10_5Inch:
                return .screen10_5Inch
            default:
                return .screen9_7Inch
            }
        case 1112:
            return .screen10_5Inch
        case 1366:
            return .screen12_9Inch
        default:
            return .unknown
        }
    }

    static public func isRetina() -> Bool {
        return UIScreen.main.scale > 1.0
    }
}


#elseif os(OSX)


import Cocoa


// MARK: - Size Methods -
extension Device {

    private static func sizeInches() -> CGFloat {
        let screen = NSScreen.main
        let description = screen?.deviceDescription
        let physicalSize = CGDisplayScreenSize(description?[.size] as? CGDirectDisplayID ?? 0)
        return floor(sqrt(pow(physicalSize.width, 2) + pow(physicalSize.height, 2)) * 0.0393701);
    }

    static public func size() -> Size {
        let size = sizeInches()

        switch size {
        case 11:
            return .screen11Inch
        case 12:
            return .screen12Inch
        case 13:
            return .screen13Inch
        case 15:
            return .screen15Inch
        case 17:
            return .screen17Inch
        case 20:
            return .screen20Inch
        case 21:
            return .screen21_5Inch
        case 24:
            return .screen24Inch
        case 27:
            return .screen27Inch
        default:
            return .unknown
        }
    }

    static public func isRetina() -> Bool {
        return (NSScreen.main?.backingScaleFactor ?? 0) > 1.0
    }

}


#elseif os(watchOS)


import WatchKit


// MARK: - Size Methods -
extension Device {

    private static func sizeInches() -> (CGFloat, CGFloat) {
        let size = WKInterfaceDevice.current().screenBounds.size
        return (size.width, size.height)
    }

    static public func size() -> Size {
        let size = sizeInches()
        switch size {
        case (136, 170):
            return .size38mm
        case (162, 197):
            return .size40mm
        case (156, 195):
            return .size42mm
        case (184, 224):
            return .size44mm
        default:
            return .unknown
        }
    }

}

#endif

