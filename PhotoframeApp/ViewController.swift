//
//  ViewController.swift
//  PhotoframeApp
//
//  Created by IACD-011 on 2022/04/28.
//

import UIKit

class ViewController: UIViewController {

    var backgroundColours: Array<UIColor> = [UIColor.gray, UIColor.red,UIColor.green,UIColor.blue,UIColor.orange,UIColor.yellow,UIColor.cyan,UIColor.purple,UIColor.systemPink,UIColor.systemBackground];
    
    var count:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        count = 0;
    }
    
    @IBOutlet weak var FrameView: UIView!
    
    @IBAction func ChangeFrameColour(_ sender: Any) {
        FrameView.backgroundColor = backgroundColours[count];
        if(count < backgroundColours.count-1){
            count+=1;
        }
        else
        {
            count = 0;
        }
    }
    @IBAction func NextPhoto(_ sender: Any) {
    }
    @IBAction func PreviousPhoto(_ sender: Any) {
    }
}

