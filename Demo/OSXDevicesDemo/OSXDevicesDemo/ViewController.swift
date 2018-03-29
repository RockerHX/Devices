//
//  ViewController.swift
//  OSXDevicesDemo
//
//  Created by RockerHX on 2018/3/29.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


import Cocoa


class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(Device.family())
        print(Device.model())
        print(Device.size())
        print(Device.version())
    }

}

