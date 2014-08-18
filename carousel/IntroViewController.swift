//
//  IntroViewController.swift
//  carousel
//
//  Created by Andrew Chin on 8/15/14.
//  Copyright (c) 2014 Andrew Chin. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fullImageView: UIImageView!
    
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!
    
    var yOffsets : [Float] = [-285, -240, -430, -408, -520, -500]
    var xOffsets : [Float] = [-70, 45, 36, 90, -130, -75]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
   var tileArray: [UIImageView] = []
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }

    
    override func viewDidLoad() {
        //initialize the tileArray after view has been loaded
        tileArray = [tile1, tile2, tile3, tile4, tile5, tile6]
        
        super.viewDidLoad()
        scrollView.contentSize = fullImageView.image.size
        
        scrollView.delegate = self
        
        transformTiles(0)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    func scrollViewDidScroll(scrollView: UIScrollView!){ // any offset changes
        var offset = Float(scrollView.contentOffset.y)

        
        println("Scroll content y: \(offset)")
        println("Scroll content y: \(yOffsets[0])")
        
        transformTiles(offset)
        
        //content offset: 0-> 568
        //x offset: -30 -> 0
        //y offset: -285 -> 0

//        
//        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -30, r2Max: 0)
//        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
//        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
//        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
//        
//        tile1.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
//        tile1.transform = CGAffineTransformScale(tile1.transform, CGFloat(scale), CGFloat(scale))
//        tile1.transform = CGAffineTransformRotate(tile1.transform, CGFloat(Double(rotation) * M_PI / 180))
//        


        
    }
    
    func transformTiles(offset: Float) {
        

//how come I cannot use offset and have to declare a pointer to it instead?
//        if (offset > 568)
//        {
//            offset = 568.0
//        }
//        else if (offset < 0)
//        {
//            offset = 0.0
//        }
//    
        
        var localOffset = offset
        if (localOffset > 568)  {
            localOffset = 568.0
        }
        else if (localOffset < 0) {
            localOffset = 0.0
        }

        
        for index in 0...5 {
        var tx = convertValue(localOffset, r1Min: 0, r1Max: 568, r2Min: xOffsets[index], r2Max: 0)
        var ty = convertValue(localOffset, r1Min: 0, r1Max: 568, r2Min: yOffsets[index], r2Max: 0)
        var scale = convertValue(localOffset, r1Min: 0, r1Max: 568, r2Min: scales[index], r2Max: 1)
        var rotation = convertValue(localOffset, r1Min: 0, r1Max: 568, r2Min: rotations[index], r2Max: 0)
        
        tileArray[index].transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tileArray[index].transform = CGAffineTransformScale(tileArray[index].transform, CGFloat(scale), CGFloat(scale))
        tileArray[index].transform = CGAffineTransformRotate(tileArray[index].transform, CGFloat(Double(rotation) * M_PI / 180))
        println("index: \(index)")
        println("tile Array: \(tileArray[index])")
        println("tile1: \(tile1)")
        println("xOffsets: \(xOffsets[index])")
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
