//
//  ViewController.swift
//  PhotoframeApp
//
//  Created by IACD-011 on 2022/04/28.
//

import UIKit

class ViewController: UIViewController {

    var ColourOptions: Array<UIColor> = [UIColor.gray, UIColor.red,UIColor.green,UIColor.blue,UIColor.orange,UIColor.yellow,UIColor.cyan,UIColor.purple,UIColor.systemPink,UIColor.systemBackground];
    //var images:Array<String> = ["IMG_00", "IMG_01", "IMG_02", "IMG_03", "IMG_04", "IMG_05", "IMG_06", "IMG_07"];
    var pictures = [String]()
    var currentImg:Int = 0;
    
    
    var frameCount:Int = 0;
    var backgroundCount:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path);
               
        for item in items {
            if item.hasPrefix("IMG") {
                //print("Hello!");
                // this is a picture to load!
                pictures.append(item);
            }
        }
        
        frameCount = 0;
        backgroundCount = 0;
        
        currentImg = 0;
        lblImageName.text = pictures[currentImg]
        ivPhotoContainer.image = UIImage (imageLiteralResourceName: pictures[currentImg]);
        
        print("Pictures: \n");
        print(pictures);
    }
    
    @IBOutlet var BackgroundView: UIView!
    @IBOutlet weak var ivPhotoContainer: UIImageView!
    @IBOutlet weak var FrameView: UIView!
    @IBOutlet weak var lblImageName: UILabel!
    
    @IBAction func ChangeFrameColour(_ sender: Any) {
        FrameView.backgroundColor = ColourOptions[frameCount];
        if(frameCount < ColourOptions.count-1){
            frameCount+=1;
        }
        else
        {
            frameCount = 0;
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
        if(currentImg < pictures.count-1){
            currentImg += 1;
        }
        else{
            currentImg = 0;
        }
        //print("ITEM NUMBER: " + String(currentImg))
        lblImageName.text = pictures[currentImg]
        ivPhotoContainer.image = UIImage (imageLiteralResourceName: pictures[currentImg]);
    }
    @IBAction func PreviousPhoto(_ sender: Any) {
        if(currentImg > 0){
            currentImg -= 1;
        }
        else{
            currentImg = pictures.count-1;
        }
        print("ITEM NUMBER: " + String(currentImg));
        lblImageName.text = pictures[currentImg]
        ivPhotoContainer.image = UIImage (imageLiteralResourceName: pictures[currentImg]);
    }
}

