//
//  LoginViewController.swift
//  Twitter
//
//  Created by Christopher Dabalsa on 3/1/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") ==  true{
            self.performSegue(withIdentifier: "LoginToHome", sender:self)
        }
    }
    
    @IBAction func onTapLogin(_ sender: Any) {
        let urlString = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url:urlString, success: {
            //present home table
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "LoginToHome", sender:self)
        }, failure: { (Error) in
            //notify user error has occured
            let title = "Error"
            let message = "An error has occured. Unable to log-in."
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
