//
//  FeedViewController.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 02.06.2022.
//

import UIKit
import StorageService

class FeedViewController: UIViewController {
    
    var post = PostFeed(Title: "Мой пост")
    
    
    private lazy var checkGuessButton: CustomButton = {
        let button = CustomButton(title: "Проверить", bgColor: .black, tilteColor: .white)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private lazy var textFielFeed: CustomTextField = {
        let textField = CustomTextField(placeholderTitle: "Enter the secret code")
        textField.delegate = self
        return textField
    }()
    
    private lazy var statusFeedLabel: UILabel = {
        let statusFeed = UILabel()
        statusFeed.translatesAutoresizingMaskIntoConstraints = false
        return statusFeed
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Лента"
        setUpStackView()
    }

    private func setUpStackView() {
        view.addSubview(textFielFeed)
        view.addSubview(checkGuessButton)
        view.addSubview(statusFeedLabel)
        
        checkGuessButtonVerification()

        NSLayoutConstraint.activate([
            textFielFeed.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            textFielFeed.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textFielFeed.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textFielFeed.heightAnchor.constraint(equalToConstant: 50),
            
            
            checkGuessButton.topAnchor.constraint(equalTo: textFielFeed.bottomAnchor, constant: 30),
            checkGuessButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            checkGuessButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            //statusFeedLabel.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 60),
            statusFeedLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            statusFeedLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }


    private func checkGuessButtonVerification() {
        checkGuessButton.actionButton = {
            
            guard let textFielFeed = self.textFielFeed.text else { return }
            
            let resultat = FeedModel.shared.correctedWord(textFielFeed)
          
            self.statusFeedLabel.text = resultat.text
            self.statusFeedLabel.textColor = resultat.textColor
        }
    }
}

extension FeedViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
