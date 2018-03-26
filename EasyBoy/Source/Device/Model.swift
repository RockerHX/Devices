//
//  Model.swift
//  EasyBoy
//
//  Created by RockerHX on 2018/3/23.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


extension Device {

    public enum Model: String {

        /*** unknown ***/
        case unknown

        #if os(iOS)

        /*** iPod ***/
        case iPodTouch5Gen
        case iPodTouch6Gen
        /*** iPhone ***/
        case iPhone4
        case iPhone4S
        case iPhone5
        case iPhone5C
        case iPhone5S
        case iPhone6
        case iPhone6Plus
        case iPhone6S
        case iPhone6SPlus
        case iPhoneSE
        case iPhone7
        case iPhone7Plus
        case iPhone8
        case iPhone8Plus
        case iPhoneX
        /*** iPad ***/
        case iPad3
        case iPad4
        case iPad5
        case iPadAir
        case iPadAir2
        case iPadMini
        case iPadMini2
        case iPadMini3
        case iPadMini4
        case iPadPro9_7Inch
        case iPadPro10_5Inch
        case iPadPro12_9Inch

        #elseif os(OSX)

        case mac

        #elseif os(tvOS)

        case AppleTV1Gen
        case AppleTV2Gen
        case AppleTV3Gen
        case AppleTV4Gen
        case AppleTV4K

        #elseif os(watchOS)

        case AppleWatch
        case AppleWatchSeries1
        case AppleWatchSeries2
        case AppleWatchSeries3

        #endif

    }

}


// MARK: - Model Methods -
extension Device {

    static fileprivate func getModel(byCode code: String) -> Model {
        #if os(iOS)
        switch code {
        /*** iPod touch ***/
        case "iPod5,1":                                  return .iPodTouch5Gen
        case "iPod7,1":                                  return .iPodTouch6Gen
        /*** iPhone ***/
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":      return .iPhone4
        case "iPhone4,1", "iPhone4,2", "iPhone4,3":      return .iPhone4S
        case "iPhone5,1", "iPhone5,2":                   return .iPhone5
        case "iPhone5,3", "iPhone5,4":                   return .iPhone5C
        case "iPhone6,1", "iPhone6,2":                   return .iPhone5S
        case "iPhone7,2":                                return .iPhone6
        case "iPhone7,1":                                return .iPhone6Plus
        case "iPhone8,1":                                return .iPhone6S
        case "iPhone8,2":                                return .iPhone6SPlus
        case "iPhone8,4":                                return .iPhoneSE
        case "iPhone9,1", "iPhone9,3":                   return .iPhone7
        case "iPhone9,2", "iPhone9,4":                   return .iPhone7Plus
        case "iPhone10,1", "iPhone10,4":                 return .iPhone8
        case "iPhone10,2", "iPhone10,5":                 return .iPhone8Plus
        case "iPhone10,3", "iPhone10,6":                 return .iPhoneX
        /*** iPad ***/
        case "iPad3,1", "iPad3,2", "iPad3,3":            return .iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6":            return .iPad4
        case "iPad6,11", "iPad6,12":                     return .iPad5
        case "iPad4,1", "iPad4,2", "iPad4,3":            return .iPadAir
        case "iPad5,3", "iPad5,4":                       return .iPadAir2
        case "iPad2,5", "iPad2,6", "iPad2,7":            return .iPadMini
        case "iPad4,4", "iPad4,5", "iPad4,6":            return .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9":            return .iPadMini3
        case "iPad5,1", "iPad5,2":                       return .iPadMini4
        case "iPad6,7", "iPad6,8", "iPad7,1", "iPad7,2": return .iPadPro12_9Inch
        case "iPad7,3", "iPad7,4":                       return .iPadPro10_5Inch
        case "iPad6,3", "iPad6,4":                       return .iPadPro9_7Inch
        /*** Unknown ***/
        default:                                         return .unknown
        }
        #elseif os(OSX)
        return .mac
        #elseif os(tvOS)
        switch code {
        case "AppleTV1,1":               return .AppleTV1Gen
        case "AppleTV2,1":               return .AppleTV2Gen
        case "AppleTV3,1", "AppleTV3,2": return .AppleTV3Gen
        case "AppleTV5,3":               return .AppleTV4Gen
        case "AppleTV6,2":               return .AppleTV4K
        default:                         return .unknown
        }
        #elseif os(watchOS)
        switch code {
        case "Watch1,1", "Watch1,2":                         return .AppleWatch
        case "Watch2,6", "Watch2,7":                         return .AppleWatchSeries1
        case "Watch2,3", "Watch2,4":                         return .AppleWatchSeries2
        case "Watch3,1", "Watch3,2", "Watch3,3", "Watch3,4": return .AppleWatchSeries3
        default:                                             return .unknown
        }
        #endif
    }

    static public func model() -> Model {
        return getModel(byCode: code())
    }

}

