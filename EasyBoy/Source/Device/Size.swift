//
//  Size.swift
//  EasyBoy
//
//  Created by RockerHX on 2018/3/23.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


import UIKit


extension Device {

    public enum Size: Int, Comparable {

        case unknown = 0

        #if os(iOS)

        case screen3_5Inch
        case screen4Inch
        case screen4_7Inch
        case screen5_5Inch
        case screen5_8Inch
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

