//
//  Size.swift
//  EasyBoy
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

