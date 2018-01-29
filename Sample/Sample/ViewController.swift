//
//  ViewController.swift
//  Sample
//
//  Created by 李二狗 on 2018/1/29.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

import UIKit
import UIClosure

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.onTap(taps: 1, touches: 1) { (tap) in
            self.label.text = "self.view.onTap"
        }
        
        self.label.onLongPress(taps: 1, touches: 1, minDuration: 1, allowableMovement: 20) { (longpress) in
            self.label.text = "self.label.onLongPress"
        }
        
        self.field.onChange { (text) in
            self.label.text = text.isEmpty ? #function : text
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

