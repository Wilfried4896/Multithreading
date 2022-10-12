//
//  LogInViewController.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 11.06.2022.
//

import UIKit

class LogInViewController: UIViewController {

    var loginDelegate: LoginFactory?
    var viewModel: LoginNavigation?
    
    private lazy var scrollViewLogin: UIScrollView = {
        let scrollLogin = UIScrollView()
        scrollLogin.translatesAutoresizingMaskIntoConstraints = false
        return scrollLogin
    }()

    private lazy var logoVk: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()

    private lazy var emailLogin: UITextField = {
        let email = parametrTextField()
        email.tag = 0
        email.placeholder = "Email of phone"
        email.keyboardType = .emailAddress
        return email
    }()

    private lazy var passwordLogin: UITextField = {
        let password = parametrTextField()
        password.tag = 1
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        return password
    }()

    private lazy var logInButton: CustomButton = {
        let logIn = CustomButton(title: "Log In",bgColor: UIColor(patternImage: UIImage(named: "blue_pixel")!) ,tilteColor: .white)
        logIn.layer.cornerRadius = 10
        
        return logIn
    }()
    
    private lazy var buttonGetPassword: CustomButton = {
        let getPassword = CustomButton(title: "Подобрать пароль", bgColor: .systemBlue, tilteColor: .white)
        getPassword.layer.cornerRadius = 10
        
        return getPassword
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor(patternImage: UIImage(named: "blue_pixel")!)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpLogInView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self, selector: #selector(self.didShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.didHidekeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    private func setUpLogInView() {
        self.view.backgroundColor = .white
        self.view.addSubview(scrollViewLogin)

        [logoVk, emailLogin, passwordLogin, logInButton, buttonGetPassword, activityIndicator].forEach({
            self.scrollViewLogin.addSubview($0)
        })

        actionButton()
        self.navigationController?.navigationBar.isHidden = true

        NSLayoutConstraint.activate([
            // scrollViewLoginConstraint
            scrollViewLogin.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollViewLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollViewLogin.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollViewLogin.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            // logoVkConstraints
            logoVk.topAnchor.constraint(equalTo: scrollViewLogin.topAnchor, constant: 120),
            logoVk.centerXAnchor.constraint(equalTo: scrollViewLogin.centerXAnchor),
            logoVk.heightAnchor.constraint(equalToConstant: 100),
            logoVk.widthAnchor.constraint(equalToConstant: 100),

            // emailLoginConstraints
            emailLogin.topAnchor.constraint(equalTo: logoVk.bottomAnchor, constant: 120),
            emailLogin.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            emailLogin.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailLogin.heightAnchor.constraint(equalToConstant: 50),

            // passwordLoginConstraints
            passwordLogin.topAnchor.constraint(equalTo: emailLogin.bottomAnchor),
            passwordLogin.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            passwordLogin.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            passwordLogin.heightAnchor.constraint(equalToConstant: 50),
            
            // activityIndicator
            activityIndicator.topAnchor.constraint(equalTo: emailLogin.bottomAnchor, constant: 10),
            activityIndicator.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),

            // logInButtonConstraints
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logInButton.topAnchor.constraint(equalTo: passwordLogin.bottomAnchor, constant: 16),
            
            // buttonGetPassword
            buttonGetPassword.heightAnchor.constraint(equalToConstant: 50),
            buttonGetPassword.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonGetPassword.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonGetPassword.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 16),
            
        ])
    }
    
    func parametrTextField() -> UITextField {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        //textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.systemGray6
        textField.autocapitalizationType = .none
        textField.font = .systemFont(ofSize: 16)
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }

    @objc func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height

            let logInButtonPositionY = self.logInButton.frame.origin.y + self.logInButton.frame.height + self.view.safeAreaInsets.top
            let keyboardOriginY = self.view.frame.height - keyboardHeight

            let yOffet = keyboardOriginY < logInButtonPositionY ? logInButtonPositionY - keyboardOriginY + 15 : 0

            self.scrollViewLogin.contentOffset = CGPoint(x: 0, y: yOffet)
        }
    }

    @objc func didHidekeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
    }

    @objc func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollViewLogin.contentOffset = CGPoint(x: 0, y: 0)
    }

    private func actionButton() {
        
        logInButton.actionButton = {
            
            guard let emailLogin = self.emailLogin.text, let passwordLogin = self.passwordLogin.text else { return }
            
            let messageError = UIAlertController(title: "Внимание", message: "Логин или пароль некорректен", preferredStyle: .actionSheet)
            let actionMessage = UIAlertAction(title: "OK", style: .destructive)

            let loginInspector = self.loginDelegate?.makeLoginInspector()
            
            let verifiedCurrent = loginInspector?.check(loginUser: emailLogin, passwordUser: passwordLogin)
            
            guard let verifiedCurrent else { return }
                
            guard verifiedCurrent else {
                messageError.addAction(actionMessage)
                self.present(messageError, animated: true)

                return
            }
            self.viewModel?.goToHome()
        }
        
        buttonGetPassword.actionButton = {
            
            self.passwordLogin.text = "0aA!"
            self.passwordLogin.isSecureTextEntry = false
            
            let quere = DispatchQueue(label: "ru.Wifried4896", attributes: .concurrent)
            
            let workItem = DispatchWorkItem() {
                bruteForce(passwordToUnlock: "0aA!")
            }
            
            let notifyItem = DispatchWorkItem() {
                self.activityIndicator.stopAnimating()
                self.passwordLogin.isSecureTextEntry = true
            }
            
            workItem.notify(queue: .main, execute: notifyItem)
            
            self.activityIndicator.startAnimating()
            quere.async(execute: workItem)
            
        }
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
