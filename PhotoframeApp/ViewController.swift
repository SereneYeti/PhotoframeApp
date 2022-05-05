//
//  ViewController.swift
//  PhotoframeApp
//
//  Created by IACD-011 on 2022/04/28.
//

import UIKit

class ViewController: UIViewController {

    var ColourOptions: Array<UIColor> = [UIColor.gray, UIColor.red,UIColor.green,UIColor.blue,UIColor.orange,UIColor.yellow,UIColor.cyan,UIColor.purple,UIColor.systemPink,UIColor.systemBackground];
    var images:Array<String> = ["IMG_00", "IMG_01", "IMG_02", "IMG_03", "IMG_04", "IMG_05", "IMG_06", "IMG_07"];
    var currentImg:Int = 0;
    var ImgName:String = "IMG_0";
    
    var count:Int = 0;
    var backgroundCount:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        count = 0;
        currentImg = 0;
        backgroundCount = 0;
    }
    
    @IBOutlet var BackgroundView: UIView!
    @IBOutlet weak var ivPhotoContainer: UIImageView!
    @IBOutlet weak var FrameView: UIView!
    
    @IBAction func ChangeFrameColour(_ sender: Any) {
        FrameView.backgroundColor = ColourOptions[count];
        if(count < ColourOptions.count-1){
            count+=1;
        }
        else
        {
            count = 0;
        }
    }
    @IBAction func ChangeBackgroundColour(_ sender: Any) {
        BackgroundView.backgroundColor = ColourOptions[backgroundCount];
        if(backgroundCount < ColourOptions.count-1){
            backgroundCount+=1;
        }
        else
        {
            backgroundCount = 0;
        }
    }
    @IBAction func NextPhoto(_ sender: Any) {
        if(currentImg < 7){
            currentImg += 1;
        }
        else{
            currentImg = 0;
        }
        ImgName = "IMG_0" + String(currentImg);
        print(ImgName);
        ivPhotoContainer.image = UIImage (imageLiteralResourceName: ImgName);
    }
    @IBAction func PreviousPhoto(_ sender: Any) {
        if(currentImg > 0){
            currentImg -= 1;
        }
        else{
            currentImg = 7;
        }
        ImgName = "IMG_0" + String(currentImg);
        print(ImgName)
        ivPhotoContainer.image = UIImage (imageLiteralResourceName: ImgName);
    }
}

