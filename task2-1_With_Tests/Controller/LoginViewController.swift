//
//  LoginViewController.swift
//  task2-1
//
//  Created by Stepanov on 19.05.25.
//


import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let login = loginTextField.text, !login.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(title: "Ошибка", message: "Введите логин и пароль")
            return
        }

        // Сохраняем данные в UserDefaults
        let defaults = UserDefaults.standard
        defaults.set(login, forKey: "userLogin")
        defaults.set(password, forKey: "userPassword")

        performSegue(withIdentifier: "showMuseum", sender: nil)
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}