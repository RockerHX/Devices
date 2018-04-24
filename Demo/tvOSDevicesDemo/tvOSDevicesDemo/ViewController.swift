//
//  ViewController.swift
//  tvOSDevicesDemo
//
//  Created by RockerHX on 2018/3/29.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


import UIKit
import Devices


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        #if os(iOS)
        #elseif os(OSX)
        #elseif os(tvOS)
        tvOSDeviceFamily()
        tvOSDeviceModel()
        tvOSModelHelper()
        tvOSProject()
        #elseif os(watchOS)
        #endif

    }

    func tvOSDeviceFamily() {
        let family = Device.family()
        switch family {
        case .AppleTV:
            print("Device belong to \(family) family")
        case .simulator:
            print("Device belong to \(family) family")
        case .unknown:
            print("unknown Device.")
        }
    }

    func tvOSDeviceModel() {
        let model = Device.model()
        print(model.identifier)
        switch model {
        case .AppleTV4Gen:
            print("Device is a \(model)")
        case .AppleTV4K:
            print("Device is a \(model)")
        case .simulator(let model):
            print("Device is a \(model)")
        case .unknown:
            print("unknown Device.")
        }
    }

    func tvOSModelHelper() {
        let model = Device.model()
        let allTVs = Device.Model.allTVs
        if allTVs.contains(model) {
            print("Current device belong to Apple TV ")
        }
    }

    func tvOSProject() {
        print("Build: \(Device.Project().build)")
        print("Version: \(Device.Project().version)")
        print("wholeVersion: \(Device.Project().wholeVersion)")
    }

}

