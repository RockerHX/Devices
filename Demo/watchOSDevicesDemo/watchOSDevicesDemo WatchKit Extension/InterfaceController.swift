//
//  InterfaceController.swift
//  watchOSDevicesDemo WatchKit Extension
//
//  Created by RockerHX on 2018/3/30.
//  Copyright © 2018年 RockerHX. All rights reserved.
//

import WatchKit
import Foundation
import Devices


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        #if os(iOS)
        #elseif os(OSX)
        #elseif os(tvOS)
        #elseif os(watchOS)
        watchOSDeviceFamily()
        watchOSDeviceModel()
        watchOSModelHelper()
        watchOSDeviceSize()
        watchOSSizeHelper()
        watchOSApplication()
        #endif

    }

    func watchOSDeviceFamily() {
        let family = Device.family()
        switch family {
        case .AppleWatch:
            print("Device belong to \(family) family")
        case .simulator:
            print("Device belong to \(family) family")
        case .unknown:
            print("unknown Device.")
        }
    }

    func watchOSDeviceModel() {
        let model = Device.model()
        print(model.identifier)
        switch model {
            /*** iPod ***/
        case .AppleWatch:
            print("Device is a \(model)")
        case .AppleWatchSeries1:
            print("Device is a \(model)")
        case .AppleWatchSeries2:
            print("Device is a \(model)")
        case .AppleWatchSeries3:
            print("Device is a \(model)")
        case .AppleWatchSeries4:
            print("Device is a \(model)")
        case .simulator(let model):
            print("Device is a \(model)")
        case .unknown:
            print("unknown Device.")
        }
    }

    func watchOSModelHelper() {
        let model = Device.model()
        let allWatchs = Device.Model.allWatchs
        if allWatchs.contains(model) {
            print("Current device belong to Apple Watch")
        }
        let allSimulatorWatchs = Device.Model.allSimulatorWatchs
        if allSimulatorWatchs.contains(model) {
            print("Current device belong to Apple Watch Simulator")
        }
    }

    func watchOSDeviceSize() {
        let size = Device.size()
        switch size {
        case .size38mm:
            print("Device size: \(size.description)")
        case .size40mm:
            print("Device size: \(size.description)")
        case .size42mm:
            print("Device size: \(size.description)")
        case .size44mm:
            print("Device size: \(size.description)")
        case .unknown:
            print("Device size unknown.")
        }
    }

    func watchOSSizeHelper() {
        let size = Device.size()

        if size > .size38mm {
            print("Your device screen is larger than 38mm")
        }

        if size < .size38mm {
            print("Your device screen is smaller than 38mm")
        }

        if size >= .size38mm {
            print("Your device screen is equal or larger than 38mm")
        }

        if size <= .size38mm {
            print("Your device screen is equal or smaller than 38mm")
        }

        if size == .size38mm {
            print("It's a 38mm screen")
        }

        if size != .size42mm {
            print("It's not 42mm screen")
        }
    }

    func watchOSApplication() {
        print("Build: \(Device.Application.shared.build)")
        print("Version: \(Device.Application.shared.version)")
        print("wholeVersion: \(Device.Application.shared.wholeVersion)")
        print("firstLanuch: \(Device.Application.shared.firstLanuch)")
    }

}
