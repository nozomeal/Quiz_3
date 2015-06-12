//
//  ViewController.swift
//  Count_image1
//
//  Created by Nozomi Sakamoto on 2015/06/05.
//  Copyright (c) 2015年 Nozomi Sakamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number: Int = 0
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction  func plus(){
        number = number + 1
        label.text = String (number)
      
        if number % 3 == 0 {
            label.textColor = UIColor.redColor()
        }else{
            label.textColor = UIColor.blueColor()
        }
    }

    @IBAction func minus(){
        number = number - 1
        label.text = String (number)

        if number % 3 == 0 {
            label.textColor = UIColor.redColor()
        }else{
            label.textColor = UIColor.blueColor()
        }
    }
    
    @IBAction func times(){
        number = number * 2
        label.text = String (number)
        
        if number % 3 == 0 {
            label.textColor = UIColor.redColor()
        }else{
            label.textColor = UIColor.blueColor()
        }
    }

    @IBAction func devided(){
        number = number / 2
        label.text = String (number)
     
        if number % 3 == 0 {
            label.textColor = UIColor.redColor()
        }else{
            label.textColor = UIColor.blueColor()
        }
    }

    

}



