//
//  ForgetPassWordViewController.swift
//  SafeSleepApp
//
//  Created by Caio Cesar on 06/09/24.
//

import UIKit


protocol ForgotPasswordViewPresentation: AnyObject{
    func presentAlert(title: String, message: String)
    func routeToSucess()
}

class ForgotPasswordViewController: UIViewController, ForgotPasswordViewPresentation {
   
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var documentTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    
    let viewModel = ForgetPasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewController = self
    }
    
    @IBAction func changePasswordButton(_ sender: Any) {
        viewModel.validateNewPassword(email: emailTextField.text ?? "", document: documentTextField.text ?? "", password: passwordTextfield.text ?? "", confirmPassword: confirmPasswordTextfield.text ?? "")
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok, entendi", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func routeToSucess() {
        let alert = UIAlertController(title: "Sucesso", message: "Seja bem vindo", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok, entendi", style: UIAlertAction.Style.default, handler: { UIAlertAction in
            self.dismiss(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
}
