//
//  NextViewController.swift
//  TestThemeDemo
//
//  Created by yzj on 2020/4/27.
//  Copyright © 2020 yzj. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.th_backgroundColor("color.th_backgroundColor")
        label.th_textColor("color.th_textColor")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func click(_ sender: Any) {
        if Theme.shared.type == .default  {
            Theme.shared.type = .black
        }
        else {
            Theme.shared.type = .default
        }
    }
}
