//
//  ViewController.swift
//  SafeSleepApp
//
//  Created by Caio Cesar on 04/09/24.
//

import UIKit

protocol LoginViewPresentation: AnyObject{
    func presentAlert(title: String, message: String)
    func routeToSucess()
}

class ViewController: UIViewController, LoginViewPresentation {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewController = self
    }

    @IBAction func confirmButton(_ sender: Any) {
        viewModel.validateLogin(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "forgetPasswordVC")
        present(vc, animated: true)
    }
    
    @IBAction func onboardingButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "onboardingVC")
        present(vc, animated: true)
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok, entendi", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func routeToSucess() {
        let alert = UIAlertController(title: "Login realizado com sucesso", message: "Realizar Login", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok, entendi", style: UIAlertAction.Style.default, handler: { UIAlertAction in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "homeVC")
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
}

