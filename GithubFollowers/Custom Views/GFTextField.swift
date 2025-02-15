//
//  GFTextField.swift
//  GithubFollowers
//
//  Created by Shashwat Singh on 22/1/25.
//

import UIKit

class GFTextField: UITextField {
    
    //Designated/Required initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius        = 10
        layer.borderWidth         = 2
        layer.borderColor         = UIColor.systemGray4.cgColor
        
        textColor                 = .label
        tintColor                 = .label
        textAlignment             = .center
        font                      = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize           = 12
        
        backgroundColor           = .tertiarySystemBackground
        autocorrectionType        = .no
        
        returnKeyType             = .go //What the return key on the keyboard is going to say
        
        placeholder               = "Enter a username"
    }
    

}
