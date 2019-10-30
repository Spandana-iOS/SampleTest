//
//  ViewController.swift
//  SampleTest
//
//  Created by Spandana Nayakanti on 6/21/19.
//  Copyright © 2019 Spandana. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    let homePageView = HomePageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadNib()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadNib() {
        homePageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(homePageView)
    }
}

