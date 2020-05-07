//
//  ViewController.swift
//  TestThemeDemo
//
//  Created by yzj on 2020/4/26.
//  Copyright © 2020 yzj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.th_backgroundColor("th_backgroundColor")
        label.th_textColor("th_textColor")
        button.th_setTitleColor("th_setTitleColor", for: UIControl.State.normal)
        imageView.th_image("th_image")
        
    }


    @IBAction func click(_ sender: Any) {
        if Theme.shared.type == .default  {
            Theme.shared.type = .black
        }
        else {        
            Theme.shared.type = .default
        }
    }
}

