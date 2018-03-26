//
//  ViewController.swift
//  EasyBoy
//
//  Created by RockerHX on 2018/3/23.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(UIDevice.current.model)
        print(UIDevice.current.localizedModel)
        print(UIDevice.current.name)
        print(UIDevice.current.systemName)
        print(UIDevice.current.systemVersion)
        print(UIDevice.current.userInterfaceIdiom)
        print(UIDevice.current.batteryLevel)
        print(UIDevice.current.batteryState)
        print(UIDevice.current.identifierForVendor)
        print(UIDevice.current.debugDescription)
        print(UIDevice.current.description)
//        Device.version()
    }

}

