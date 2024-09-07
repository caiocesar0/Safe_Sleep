//
//  OnboardingViewController.swift
//  SafeSleepApp
//
//  Created by Caio Cesar on 06/09/24.
//

import UIKit

protocol OnboardingViewPresentation: AnyObject{
    func presentAlert(title: String, message: String)
    func routeToSucess()
}

class OnboardingViewContrroller: UIViewController, OnboardingViewPresentation {
   
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var documentTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextfield: UITextField!
    
    let viewModel = OnboardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewController = self
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        viewModel.validateUser(name: nameTextField.text ?? "", document: documentTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "", confirmPassword: passwordConfirmTextfield.text ?? "")
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok, entendi", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func routeToSucess() {
        let alert = UIAlertController(title: "Conta cadastrada com sucesso", message: "Realizar Login", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok, entendi", style: UIAlertAction.Style.default, handler: { UIAlertAction in
            self.dismiss(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
}
