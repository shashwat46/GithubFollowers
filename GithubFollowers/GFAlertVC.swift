//
//  GFAlertVC.swift
//  GithubFollowers
//
//  Created by Shashwat Singh on 22/1/25.
//

import UIKit

class GFAlertVC: UIViewController {

    let containerView = UIView()
    let titleLabel    = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel  = GFBodyLabel(textAlignment: .center)
    let actionButton  = GFButton(backgroundColor: .systemPink, title: "OK")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String){
        super.init(nibName: nil, bundle: nil)
        self.alertTitle     = title
        self.message        = message
        self.buttonTitle    = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    
    func configureContainerView(){
        view.addSubview(containerView)
        containerView.backgroundColor    = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth  = 2
        containerView.layer.borderColor  = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            containerView.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    
    func configureTitleLabel(){
        containerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
        ])
    }
    
    func configureActionButton(){
        containerView.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.setTitle(buttonTitle ?? "OK", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureMessageLabel(){
        containerView.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text          = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 4
        
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor,constant: -12)
        ])
    }
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }

}
