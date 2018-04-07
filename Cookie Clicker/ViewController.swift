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
    var storeOpen: Bool = false;
    
    @IBOutlet var cookieNumberLabel: UILabel!
    @IBOutlet var perSecondLabel: UILabel!
    @IBOutlet var storeLabel: UIButton!
    @IBOutlet var buyCursorButton: UIButton!
    @IBOutlet var buyFactoryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("cookiesPerSecond"), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
        perSecondLabel.text = "Per Second: \(cookiesPerSec)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressCookie(sender: AnyObject){
        addCookies(1)
    }
    
    @IBAction func toggleStore(sender: AnyObject){
        if(!storeOpen){
            storeOpen = true
            storeLabel.setTitle("Back", for: .normal)
            buyCursorButton.alpha = 1
            buyFactoryButton.alpha = 1
        } else {
            storeOpen = false
            storeLabel.setTitle("Store", for: .normal)
            buyCursorButton.alpha = 0
            buyFactoryButton.alpha = 0
        }
    }
    
    @IBAction func buyCursor(sender: AnyObject){
        if(cookies >= 30){
            cookies -= 30
            cookiesPerSec += 0.1
            cookieNumberLabel.text = "Cookies: \(floor(cookies))"
            perSecondLabel.text = "Per Second: \(cookiesPerSec)"

        }
    }
    
    @IBAction func buyFactory(sender: AnyObject){
        if(cookies >= 1){
            cookies -= 1
            cookiesPerSec += 10000
            cookieNumberLabel.text = "Cookies: \(floor(cookies))"
            perSecondLabel.text = "Per Second: \(cookiesPerSec)"

        }
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

