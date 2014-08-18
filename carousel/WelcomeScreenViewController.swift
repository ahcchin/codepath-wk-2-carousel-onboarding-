//
//  WelcomeScreenViewController.swift
//  carousel
//
//  Created by Andrew Chin on 8/17/14.
//  Copyright (c) 2014 Andrew Chin. All rights reserved.
//

import UIKit

class WelcomeScreenViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var backButtonView: UIView!
    @IBOutlet weak var backupButtonImageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 1280, height: 568)

        scrollView.delegate = self
        
        backButtonView.alpha = 0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if (page == 3)
        {
            UIView.animateWithDuration(0.4, animations: {
                    self.backButtonView.alpha = 1
                    self.pageControl.hidden = true
            })
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
