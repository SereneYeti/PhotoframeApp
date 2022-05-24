//
//  ViewController.swift
//  PhotoframeApp
//
//  Created by IACD-011 on 2022/04/28.
//

import UIKit

class ViewController: UIViewController {

    let colourWell: UIColorWell = {
        let colourWell = UIColorWell()
        colourWell.supportsAlpha = true
        colourWell.selectedColor = .systemRed
        colourWell.title = "Background Colour Picker"
        return colourWell
    }()
    let colourWell2: UIColorWell = {
        let colourWell = UIColorWell()
        colourWell.supportsAlpha = true
        colourWell.selectedColor = .systemBlue
        colourWell.title = "Frame Colour Picker"
        return colourWell
    }()
    
    var pictures = [String]()
    var currentImg:Int = 0;
    
    
    var frameCount:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Colour Well Setup
        view.backgroundColor = colourWell.selectedColor;
        FrameView.backgroundColor = colourWell2.selectedColor;
        view.addSubview(colourWell)
        
        colourWell.addTarget(self, action: #selector(backgroundColourChanged), for: .valueChanged)
        
        view.addSubview(colourWell2)
        
        colourWell2.addTarget(self, action: #selector(frameColourChanged), for: .valueChanged)
        
        //Find Images
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
       
        currentImg = 0;
        lblImageName.text = pictures[currentImg]
        ivPhotoContainer.image = UIImage (imageLiteralResourceName: pictures[currentImg]);
        
        print("Pictures: \n");
        print(pictures);
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        colourWell.frame = CGRect(x: view.safeAreaInsets.left+10, y: view.safeAreaInsets.bottom,
                                  width: 50, height: 50)
        colourWell2.frame = CGRect(x: view.safeAreaInsets.left+10, y: view.safeAreaInsets.bottom+50,
                                  width: 50, height: 50)
    }
    
    @IBOutlet var BackgroundView: UIView!
    @IBOutlet weak var ivPhotoContainer: UIImageView!
    @IBOutlet weak var FrameView: UIView!
    @IBOutlet weak var lblImageName: UILabel!
    
    
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
    
    @objc private func backgroundColourChanged(){
        view.backgroundColor = colourWell.selectedColor
        
    }
    @objc private func frameColourChanged(){
        FrameView.backgroundColor = colourWell2.selectedColor
        
    }
}

