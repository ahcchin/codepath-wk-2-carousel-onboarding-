//
//  SignInViewController.swift
//  carousel
//
//  Created by Andrew Chin on 8/17/14.
//  Copyright (c) 2014 Andrew Chin. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackButton(sender: AnyObject) {
        
        navigationController.popToRootViewControllerAnimated(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        formView.center.y = 175
    
    }
    
    
    func keyboardWillHide(notification: NSNotification!) {
        formView.center.y = 285
        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    

    
    @IBAction func onSignInPressed(sender: AnyObject) {
        
        if (emailTextField.text.isEmpty) {
            var alertView = UIAlertView(title: "Email Required", message: "Please enter an email", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
            
        else if (passwordTextField.text.isEmpty) {
            var alertView = UIAlertView(title: "Password Required", message: "Please enter a password", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
        else if (emailTextField.text == "andrew.chin@gmail.com" && passwordTextField.text == "123"){
            
            var delayView = UIAlertView ()
            delayView.title = "Signing in..."
            delayView.show()
            delay(2){
                delayView.dismissWithClickedButtonIndex(0, animated: true)
                self.performSegueWithIdentifier("welcomeSegue", sender: self)
            }
        }
        else {
            
            var delayView = UIAlertView ()
            delayView.title = "Signing in..."
                        delayView.show()
            delay(2){
            delayView.dismissWithClickedButtonIndex(0, animated: true)
    
            var alertView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            }

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
