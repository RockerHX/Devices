//
//  ViewController.swift
//  OSXDevicesDemo
//
//  Created by RockerHX on 2018/3/29.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


import Cocoa
import Devices


class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        #if os(iOS)
        #elseif os(OSX)
        OSXDeviceFamily()
        OSXDeviceModel()
        OSXModelHelper()
        OSXDeviceSize()
        OSXSizeHelper()
        OSXBrightness()
        OSXApplication()
        #elseif os(tvOS)

        #elseif os(watchOS)

        #endif
    }

    func OSXDeviceFamily() {
        let family = Device.family()
        switch family {
        case .MacMini:
            print("Device belong to \(family) family")
        case .MacBookAir:
            print("Device belong to \(family) family")
        case .MacBook:
            print("Device belong to \(family) family")
        case .MacBookPro:
            print("Device belong to \(family) family")
        case .iMac:
            print("Device belong to \(family) family")
        case .iMacPro:
            print("Device belong to \(family) family")
        case .MacPro:
            print("Device belong to \(family) family")
        case .XServe:
            print("Device belong to \(family) family")
        default:
            print("unknown Device.")
        }
    }

    func OSXDeviceModel() {
        let model = Device.model()
        print(model.identifier)
        switch model {
        /*** Mac Mini ***/
        case .MacMini2012Late:
            print("Device is a \(model)")
        case .MacMini2014Late:
            print("Device is a \(model)")
        /*** MacBook Air ***/
        case .MacBookAir2012Mid:
            print("Device is a \(model)")
        case .MacBookAir2013MidAnd2014Early:
            print("Device is a \(model)")
        case .MacBookAir2015Early:
            print("Device is a \(model)")
        case .MacBookAir2017Mid:
            print("Device is a \(model)")
        /*** MacBook ***/
        case .MacBook2015Early:
            print("Device is a \(model)")
        case .MacBook2016Early:
            print("Device is a \(model)")
        case .MacBook2017Mid:
            print("Device is a \(model)")
        /*** MacBook Pro ***/
        case .MacBookPro2010Mid:
            print("Device is a \(model)")
        case .MacBookPro2011:
            print("Device is a \(model)")
        case .MacBookPro2012Mid:
            print("Device is a \(model)")
        /*** MacBook Pro Retina ***/
        case .MacBookProRetina2012Mid:
            print("Device is a \(model)")
        case .MacBookProRetina2012Late:
            print("Device is a \(model)")
        case .MacBookProRetina2014Mid:
            print("Device is a \(model)")
        case .MacBookProRetina2015Early:
            print("Device is a \(model)")
        case .MacBookProRetina2015Mid:
            print("Device is a \(model)")
        case .MacBookProRetina2016Late:
            print("Device is a \(model)")
        case .MacBookProRetina2017Mid:
            print("Device is a \(model)")
        /*** iMac ***/
        case .iMac2012Late:
            print("Device is a \(model)")
        case .iMac2013Late:
            print("Device is a \(model)")
        case .iMac2014Mid:
            print("Device is a \(model)")
        case .iMac2015Late:
            print("Device is a \(model)")
        case .iMac2017:
            print("Device is a \(model)")
        /*** iMac Retina ***/
        case .iMacRetina2014Late:
            print("Device is a \(model)")
        case .iMacRetina2015Late:
            print("Device is a \(model)")
        case .iMacRetina2017Mid:
            print("Device is a \(model)")
        /*** iMac Pro ***/
        case .iMacPro:
            print("Device is a \(model)")
        /*** Mac Pro ***/
        case .MacPro2012Mid:
            print("Device is a \(model)")
        case .MacPro2013Late:
            print("Device is a \(model)")
        case .MacPro2017Early:
            print("Device is a \(model)")
        case .simulator(let model):
            print("Device is a \(model)")
            /*** unknown ***/
        case .unknown:
            print("unknown Device.")
        }
    }

    func OSXModelHelper() {
        let model = Device.model()
        let allMacBookProes = Device.Model.allMacBookProes
        if allMacBookProes.contains(model) {
            print("Current device belong to MacBookPro ")
        }
    }

    func OSXDeviceSize() {
        let size = Device.size()
        switch size {
        case .screen11Inch:
            print("Device size: \(size.description)")
        case .screen12Inch:
            print("Device size: \(size.description)")
        case .screen13Inch:
            print("Device size: \(size.description)")
        case .screen15Inch:
            print("Device size: \(size.description)")
        case .screen17Inch:
            print("Device size: \(size.description)")
        case .screen20Inch:
            print("Device size: \(size.description)")
        case .screen21_5Inch:
            print("Device size: \(size.description)")
        case .screen24Inch:
            print("Device size: \(size.description)")
        case .screen27Inch:
            print("Device size: \(size.description)")
        case .unknown:
            print("Device size unknown.")
        }
    }

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

    func OSXBrightness() {
        print("Device.Brightness.level: \(Device.Brightness.level)")
        Device.Brightness.level = .level_5
        Device.Brightness.level = .custom(0.5)
    }

    func OSXApplication() {
        print("Build: \(Device.Application.shared.build)")
        print("Version: \(Device.Application.shared.version)")
        print("wholeVersion: \(Device.Application.shared.wholeVersion)")
        print("firstLanuch: \(Device.Application.shared.firstLanuch)")
    }

}
