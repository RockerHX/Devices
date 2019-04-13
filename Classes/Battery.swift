//
//  Battery.swift
//  Devices
//
//  Created by RockerHX on 2018/4/1.
//


#if os(iOS)


import UIKit


extension Device {

    public enum Battery {

        public enum State {
            /// The device battery power is 100% or the device is the Simulator.
            case full
            /// The device is plugged into power and the battery is less than 100% charged.
            /// The associated value is in percent (0-100).
            case charging(Int)
            /// The device is not plugged into power; the battery is discharging.
            /// The associated value is in percent (0-100).
            case unplugged(Int)

            case unknown

            fileprivate init() {
                UIDevice.current.isBatteryMonitoringEnabled = true
                let batteryLevel = Int(round(UIDevice.current.batteryLevel * 100))
                switch UIDevice.current.batteryState {
                case .full: self = .full
                case .charging: self = .charging(batteryLevel)
                case .unplugged:self = .unplugged(batteryLevel)
                case .unknown: self = .unknown
                @unknown default:
                    fatalError()
                }
                UIDevice.current.isBatteryMonitoringEnabled = false
            }

        }

        /// The user enabled Low Power mode
        static public var lowPowerMode: Bool {
            if #available(iOS 9.0, *) {
                return ProcessInfo.processInfo.isLowPowerModeEnabled
            } else {
                return false
            }
        }

        /// The state of the battery
        static public var state: State {
            return State()
        }

        /// Battery level ranges from 0 (fully discharged) to 100 (100% charged).
        static public var level: Int {
            switch State() {
            case .full: return 100
            case .charging(let value): return value
            case .unplugged(let value): return value
            case .unknown: return 0
            }
        }

    }

}


// MARK: - CustomStringConvertible -
extension Device.Battery.State: CustomStringConvertible {

    public var description: String {
        switch self {
        case .full:                         return "Battery level: 100 % (Full), device is plugged in."
        case .charging(let batteryLevel):   return "Battery level: \(batteryLevel)%, device is plugged in."
        case .unplugged(let batteryLevel):  return "Battery level: \(batteryLevel)%, device is unplugged."
        case .unknown:                      return "Battery level: 0 % (Unknown), device is plugged in."
        }
    }

}


// MARK: - Comparable -
extension Device.Battery.State: Comparable {

    /// Tells if two battery states are equal.
    ///
    /// - parameter lhs: A battery state.
    /// - parameter rhs: Another battery state.
    ///
    /// - returns: `true` iff they are equal, otherwise `false`
    public static func == (lhs: Device.Battery.State, rhs: Device.Battery.State) -> Bool {
        return lhs.description == rhs.description
    }

    /// Compares two battery states.
    ///
    /// - parameter lhs: A battery state.
    /// - parameter rhs: Another battery state.
    ///
    /// - returns: `true` if rhs is `.Full`, `false` when lhs is `.Full` otherwise their battery level is compared.
    public static func < (lhs: Device.Battery.State, rhs: Device.Battery.State) -> Bool {
        switch (lhs, rhs) {
        case (.charging(let lhsLevel), .charging(let rhsLevel)): return lhsLevel < rhsLevel
        case (.charging(let lhsLevel), .unplugged(let rhsLevel)): return lhsLevel < rhsLevel
        case (.unplugged(let lhsLevel), .charging(let rhsLevel)): return lhsLevel < rhsLevel
        case (.unplugged(let lhsLevel), .unplugged(let rhsLevel)): return lhsLevel < rhsLevel
        case (.full, _):    return false
        case (_, .full):    return true
        default:            return false
        }
    }

}


#elseif os(OSX)

#elseif os(tvOS)

#elseif os(watchOS)

#endif

