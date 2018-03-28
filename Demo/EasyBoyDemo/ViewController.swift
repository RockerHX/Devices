//
//  ViewController.swift
//  EasyBoy
//
//  Created by RockerHX on 2018/3/23.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


import UIKit
import EasyBoy


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("device: \(Device.family())")
        switch Device.model() {
        case .simulator(let model):
            switch model {
            case .iPhone8:
                print("device: \(Device.model())")
            default:
                break;
            }
        default:
            break
        }

        if Device.model() == .simulator(.iPhone8) {
            print("iPhone8")
        }
        
    }

}

