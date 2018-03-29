//
//  ViewController.swift
//  tvOSDevicesDemo
//
//  Created by RockerHX on 2018/3/29.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(Device.family())
        print(Device.model())
    }


}

