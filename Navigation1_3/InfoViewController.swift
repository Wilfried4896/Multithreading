//
//  InfoViewController.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 04.06.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemGray3
        self.navigationItem.title = "Информация"
        self.view.addSubview(buttonConfirmation)
    }

    lazy var buttonConfirmation: UIButton = {
        let buttonConfirmation = UIButton()
        buttonConfirmation.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
        buttonConfirmation.center = self.view.center
        buttonConfirmation.setTitle("Выйти", for: .normal)
        buttonConfirmation.addTarget(self, action: #selector(alertMessage), for: .touchUpInside)

        return buttonConfirmation
    }()

    @objc func alertMessage() {
        let alertController = UIAlertController(title: "Выйти из этой страницы", message: "Хотите выйти ?", preferredStyle: .alert)

        let cancelButton = UIAlertAction(title: "Да", style: .cancel) { _ in
            self.dismiss(animated: true)
            print("Вышел")
        }
        alertController.addAction(cancelButton)

        let okButton = UIAlertAction(title: "Нет", style: .destructive) { _ in
            print("Еще не зокнчил")
        }
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
}
