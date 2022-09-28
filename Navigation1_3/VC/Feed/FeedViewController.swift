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
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Лента"
        setUpStackView()
    }

    private func setUpStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 10
        addButtonStackView(.systemCyan, nameBtton: "Первая кнопка", event: .touchUpInside, action: #selector(buttonActionPush))
        addButtonStackView(.systemIndigo, nameBtton: "Вторая кнопка", event: .touchUpInside, action: #selector(buttonActionPush))
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func addButtonStackView(_ colorButton: UIColor, nameBtton: String, event: UIControl.Event, action: Selector) {
        let button = UIButton()
        button.setTitle("\(nameBtton)", for: .normal)
        button.backgroundColor = colorButton
        button.layer.cornerRadius = 10
        button.addTarget(self, action: action, for: event)
        stackView.addArrangedSubview(button)

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 180)
        ])
    }

    @objc func buttonActionPush() {
        let postViewController = PostViewController()
        postViewController.titlePost = post.title
        navigationController?.pushViewController(postViewController, animated: true)
    }

}
