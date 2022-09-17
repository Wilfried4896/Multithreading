//
//  ProfileHeaderView.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 06.06.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {

    private var statusText: String?

    private lazy var avatarImageView: UIImageView = {
        let imageProfile = UIImageView()
        imageProfile.image = UIImage(named: "fleur")
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        imageProfile.layer.cornerRadius = 60
        imageProfile.layer.masksToBounds = true
        imageProfile.layer.borderWidth = 3
        imageProfile.layer.borderColor = UIColor.white.cgColor

        return imageProfile
    }()

    private lazy var fullNameLabel: UILabel = {
        let name = UILabel()
        name.text = "WIlfried Odi"
        name.textColor = .black
        name.font = .systemFont(ofSize: 18, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false

        return name
    }()

    private lazy var setStatusButton: UIButton = {
        let show = UIButton()
        show.setTitle("Set status", for: .normal)
        show.backgroundColor = .systemBlue
        show.translatesAutoresizingMaskIntoConstraints = false
        show.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        show.layer.cornerRadius = 10
        show.layer.shadowRadius = 4
        show.layer.borderColor = UIColor.black.cgColor
        show.layer.shadowOpacity = 0.7
        show.layer.shadowOffset = CGSize(width: 4, height: 4)

        return show
    }()

    private lazy var statusTextField: UITextField = {
        let textFiel = UITextField()
        textFiel.font = .systemFont(ofSize: 15, weight: .regular)
        textFiel.textColor = .black
        textFiel.backgroundColor = .white
        textFiel.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textFiel.translatesAutoresizingMaskIntoConstraints = false
        textFiel.layer.borderColor = UIColor.black.cgColor
        textFiel.layer.borderWidth = 1
        textFiel.layer.cornerRadius = 10
        textFiel.placeholder = "Set your status"
        textFiel.delegate = self

        return textFiel
    }()

    private lazy var statusLabel: UILabel = {
        let text = UILabel()
        text.text = "Waiting for something..."
        text.textColor = .gray
        text.font = .systemFont(ofSize: 14, weight: .regular)
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func statusTextChanged(_textField: UITextField) {
        statusText = _textField.text
    }
    
    @objc func buttonPressed() {
        guard let statusText = statusText else {
            statusLabel.text = "Нет статуса"
            return
        }
        statusLabel.text = statusText
    }

    private func setUpView() {
        [avatarImageView, fullNameLabel, setStatusButton, statusLabel, statusTextField].forEach({
           addSubview($0)
        })
        
        NSLayoutConstraint.activate([
            // avatarImageViewConstraint
            self.avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:  16),
            self.avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            self.avatarImageView.widthAnchor.constraint(equalToConstant: 120),

            // fullNameLabelConstraint
            self.fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            self.fullNameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 13),

            // statusLabelConstraint
            self.statusLabel.bottomAnchor.constraint(equalTo: self.setStatusButton.topAnchor, constant: -55),
            self.statusLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 13),
            self.statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),

            // statusTextFieldConstraint
            self.statusTextField.bottomAnchor.constraint(equalTo: self.setStatusButton.topAnchor, constant: -10),
            self.statusTextField.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 13),
            self.statusTextField.heightAnchor.constraint(equalToConstant: 40),
            self.statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),

            // setStatusButtonConstraint
            self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16),
            self.setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.setStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            self.setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true 
    }
}

