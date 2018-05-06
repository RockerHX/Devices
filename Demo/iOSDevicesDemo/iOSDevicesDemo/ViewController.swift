//
//  ViewController.swift
//  Devices
//
//  Created by RockerHX on 2018/3/23.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


import UIKit
import Devices


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        #if os(iOS)
        iOSDeviceFamily()
        iOSDeviceModel()
        iOSModelHelper()
        iOSDeviceSize()
        iOSSizeHelper()
        iOSBrightness()
        iOSBattery()
        iOSApplication()
        #elseif os(OSX)

        #elseif os(tvOS)

        #elseif os(watchOS)

        #endif
        
    }

    func iOSDeviceFamily() {
        let family = Device.family()
        switch family {
        case .iPodtouch:
            print("Device belong to \(family) family")
        case .iPhone:
            print("Device belong to \(family) family")
        case .iPad:
            print("Device belong to \(family) family")
        case .simulator:
            print("Device belong to \(family) family")
        case .unknown:
            print("unknown Device.")
        }
    }

    func iOSDeviceModel() {
        let model = Device.model()
        print(model.identifier)
        switch model {
        /*** iPod ***/
        case .iPodTouch5Gen:
            print("Device is a \(model)")
        case .iPodTouch6Gen:
            print("Device is a \(model)")
        /*** iPhone ***/
        case .iPhone4:
            print("Device is a \(model)")
        case .iPhone4S:
            print("Device is a \(model)")
        case .iPhone5:
            print("Device is a \(model)")
        case .iPhone5C:
            print("Device is a \(model)")
        case .iPhone5S:
            print("Device is a \(model)")
        case .iPhone6:
            print("Device is a \(model)")
        case .iPhone6Plus:
            print("Device is a \(model)")
        case .iPhone6S:
            print("Device is a \(model)")
        case .iPhone6SPlus:
            print("Device is a \(model)")
        case .iPhoneSE:
            print("Device is a \(model)")
        case .iPhone7:
            print("Device is a \(model)")
        case .iPhone7Plus:
            print("Device is a \(model)")
        case .iPhone8:
            print("Device is a \(model)")
        case .iPhone8Plus:
            print("Device is a \(model)")
        case .iPhoneX:
            print("Device is a \(model)")
        /*** iPad ***/
        case .iPad3:
            print("Device is a \(model)")
        case .iPad4:
            print("Device is a \(model)")
        case .iPad5:
            print("Device is a \(model)")
        case .iPad6:
            print("Device is a \(model)")
        case .iPadAir:
            print("Device is a \(model)")
        case .iPadAir2:
            print("Device is a \(model)")
        case .iPadMini:
            print("Device is a \(model)")
        case .iPadMini2:
            print("Device is a \(model)")
        case .iPadMini3:
            print("Device is a \(model)")
        case .iPadMini4:
            print("Device is a \(model)")
        case .iPadPro9_7Inch:
            print("Device is a \(model)")
        case .iPadPro12_9Inch:
            print("Device is a \(model)")
        case .iPadPro12_9Inch2:
            print("Device is a \(model)")
        case .iPadPro10_5Inch:
            print("Device is a \(model)")
        /*** HomePod ***/
        case .HomePod:
            print("Device is a \(model)")
        case .simulator(let model):
            print("Device is a \(model)")
        /*** unknown ***/
        case .unknown:
            print("unknown Device.")
        }
    }

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

    func iOSDeviceSize() {
        let size = Device.size()
        switch size {
        case .screen3_5Inch:
            print("Device size: \(size.description)")
        case .screen4Inch:
            print("Device size: \(size.description)")
        case .screen4_7Inch:
            print("Device size: \(size.description)")
        case .screen5_5Inch:
            print("Device size: \(size.description)")
        case .screen5_8Inch:
            print("Device size: \(size.description)")
        case .screen7_9Inch:
            print("Device size: \(size.description)")
        case .screen9_7Inch:
            print("Device size: \(size.description)")
        case .screen10_5Inch:
            print("Device size: \(size.description)")
        case .screen12_9Inch:
            print("Device size: \(size.description)")
        case .unknown:
            print("Device size unknown.")
        }
    }

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

    func iOSBrightness() {
        print("Device.brightness: \(Device.brightness)")
        Device.brightness = 0.8
    }

    func iOSBattery() {
        print(Device.Battery.state)
        let batteryState = Device.Battery.state

        switch batteryState {
        case .full:
            print("Your battery is happy! 😊")
        case .charging(let level):
            print("Your battery level: \(level)")
        case .unplugged(let level):
            print("Your battery level: \(level)")
        }

        if Device.Battery.lowPowerMode {
            print("Low Power mode is enabled! 🔋")
        } else {
            print("Low Power mode is disabled! 😊")
        }

        guard batteryState < .charging(80) else {
            print("Your battery is happy! 😊")
            return
        }
    }

    func iOSApplication() {
        print("Build: \(Device.Application.shared.build)")
        print("Version: \(Device.Application.shared.version)")
        print("name: \(Device.Application.shared.name)")
        print("wholeVersion: \(Device.Application.shared.wholeVersion)")
        print("firstLanuch: \(Device.Application.shared.firstLanuch)")
    }

}

