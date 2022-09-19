//
//  ProfileHeaderView.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 06.06.2022.
//

import UIKit
import SnapKit

class ProfileHeaderView: UITableViewHeaderFooterView {

    private var statusText: String?

    private lazy var avatarImageView: UIImageView = {
        let imageProfile = UIImageView()
        imageProfile.image = UIImage(named: "fleur")
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

        return name
    }()

    private lazy var setStatusButton: UIButton = {
        let show = UIButton()
        show.setTitle("Set status", for: .normal)
        show.backgroundColor = .systemBlue
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
        
        // SnapKit Contraintes
        
        avatarImageView.snp.makeConstraints { make in
            make.top.leading.equalTo(safeAreaLayoutGuide).inset(16)
            make.size.equalTo(120)
        }
        
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(27)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(13)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.bottom.equalTo(setStatusButton.snp.top).inset(-55)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(13)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        
        statusTextField.snp.makeConstraints { make in
            make.bottom.equalTo(setStatusButton.snp.top).inset(-10)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(13)
            make.height.equalTo(40)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        
        setStatusButton.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-16)
            make.leading.equalTo(safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(16)
            make.top.equalTo(avatarImageView.snp.bottom).offset(16)
            make.height.equalTo(50)
        }
    }
}
extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true 
    }
}
