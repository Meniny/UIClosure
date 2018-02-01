//
//  ViewController.swift
//  Sample
//
//  Created by 李二狗 on 2018/1/29.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

import UIKit
import UIClosure

//extension UIView {
//    func doSomething(_ then: (Self) -> Void) {
//        
//    }
//}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label.isUserInteractionEnabled = true
        self.label.onTap(taps: 1, touches: 1) { (tap, l) in
            l.text = "self.label.onTap"
        }
        
        self.view.onLongPress() { (longpress, _) in
            self.label.text = "self.view.onLongPress"
        }
        
        self.field.onChange { (text, _) in
            self.label.text = text.isEmpty ? #function : text
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

