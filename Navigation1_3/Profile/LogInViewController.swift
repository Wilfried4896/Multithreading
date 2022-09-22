//
//  LogInViewController.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 11.06.2022.
//

import UIKit

class LogInViewController: UIViewController {

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

    private lazy var logInButton: UIButton = {
        let logIn = UIButton(type: .system)
        logIn.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel")!)
        logIn.setTitleColor(UIColor.white, for: .normal)
        logIn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        logIn.setTitle("Log In", for: .normal)
        logIn.layer.cornerRadius = 10
        logIn.translatesAutoresizingMaskIntoConstraints = false
        logIn.addTarget(self, action: #selector(openProfile), for: .touchUpInside)
        return logIn
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

        [logoVk, emailLogin, passwordLogin, logInButton].forEach({
            self.scrollViewLogin.addSubview($0)
        })

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

            // logInButtonConstraints
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logInButton.topAnchor.constraint(equalTo: passwordLogin.bottomAnchor, constant: 16),
        ])
    }

    func parametrTextField() -> UITextField {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.textColor = UIColor.black
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

    @objc func openProfile() {
        let profileVC = ProfileViewController()
        
        #if DEBUG
            guard let loginIn = emailLogin.text else { return }
        #else
            guard let loginIn = emailLogin.text else { return }
        #endif
        
        let testService = TestUserService(userTest: profileVC.userCurrent).loginIn(login: loginIn)
            guard let currentLog = testService else { return }
            profileVC.userCurrent = currentLog
            navigationController?.pushViewController(profileVC, animated: true)
        
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
