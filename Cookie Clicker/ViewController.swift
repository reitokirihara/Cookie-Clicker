//
//  ViewController.swift
//  Cookie Clicker
//
//  Created by UCode on 4/4/18.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var cookies: Float = 0;
    var cookiesPerSec: Float = 0.6;
    
    @IBOutlet var cookieNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("cookiesPerSecond"), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressCookie(sender: AnyObject){
        addCookies(1)
    }
    
    func addCookies(_ cooks:Float){
        cookies += cooks
        cookieNumberLabel.text = "Cookies: \(floor(cookies))";
        cookieNumberLabel.sizeToFit();
    }
    
    @objc
    func cookiesPerSecond(){
        addCookies(cookiesPerSec)
    }
}

