//
//  ViewController.swift
//  FluentYogaKit
//
//  Created by Thanh Dang on 5/24/17.
//  Copyright © 2017 Thanh Dang. All rights reserved.
//

import UIKit
import FluentSwift

class ViewController: UIViewController {
    fileprivate var titleLabel: UILabel!
    
    fileprivate var usernameLabel: UILabel!
    fileprivate var usernameTextField: UITextField!
    fileprivate var passwordLabel: UILabel!
    fileprivate var passwordTextField: UITextField!
    fileprivate var forgotPasswordButton: UIButton!
    fileprivate var signInButton: UIButton!
    
    fileprivate var signUpLabel: UILabel!
    fileprivate var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configHeader()
        configForm()
        configFooter()
        
        Duration.measure("Layout") {
            applyLayout()
        }
        
    }
    
    fileprivate func configHeader() {
        titleLabel = UILabel().then {
            $0.text("HOMELAND")
            $0.textColor = .black
            $0.font = .h1Medium
        }
    }
    
    fileprivate func configForm() {
        usernameLabel = UILabel().then {
            $0.text("Username")
            $0.textColor = .lightGray
            $0.font = .h5
        }
        usernameTextField = UITextField().then {
            $0.placeholder("abc@xyz.com")
            $0.font = .h4
        }
        passwordLabel = UILabel().then {
            $0.text("Password")
            $0.textColor = .lightGray
            $0.font = .h5
        }
        passwordTextField = UITextField().then {
            $0.isSecureTextEntry = true
            $0.placeholder("At least 8 characters")
            $0.font = .h4
        }
        
        forgotPasswordButton = UIButton().then {
            $0.text("Forgot password?")
            $0.titleLabel?.font = .h4
            $0.setTitleColor(.black, for: .normal)
        }
        signInButton = UIButton().then {
            $0.text("Sign in")
            $0.titleLabel?.font = .h4
            $0.setTitleColor(.black, for: .normal)
            $0.addTarget(self, action: #selector(signInButtonDidTap), for: .touchUpInside)
        }
    }
    
    fileprivate func configFooter() {
        signUpLabel = UILabel().then {
            $0.text("Don't have an account?")
            $0.textColor = .lightGray
            $0.font = .h4
        }
        signUpButton = UIButton().then {
            $0.text("Sign up")
            $0.titleLabel?.font = .h4
            $0.setTitleColor(.black, for: .normal)
            $0.addTarget(self, action: #selector(signUpButtonDidTap), for: .touchUpInside)
        }
    }
    
    @objc fileprivate func signUpButtonDidTap() {
        print("signUpButton did tap !!!")
        
//        rootLayout[2]?.isEnabled(false)
//        signUpLabel.isHidden = true
//        signUpButton.isHidden = true
//        Duration.measure("titleLabel hided") {
//            rootLayout.layout()
//        }

    }

    @objc fileprivate func signInButtonDidTap() {
        print("signInButton did tap !!!")
        
        signUpLabel.yoga.isEnabled(false)
        
        Duration.measure("titleLabel shown") {
//            rootLayout.layout()
        }
    }

    fileprivate func applyLayout() {
        view.subview(
            titleLabel,
            usernameLabel,
            usernameTextField,
            passwordLabel,
            passwordTextField,
            forgotPasswordButton,
            signInButton,
            signUpLabel,
            signUpButton
        )
        
        view.yoga.vertical(
            titleLabel.yoga
                .crossSelf(align: .flexStart),
            30,
            YGLayout.vertical(
                usernameLabel,
                8,
                usernameTextField,
                16,
                passwordLabel,
                8,
                passwordTextField,
                16,
                YGLayout.horizontal(
                    forgotPasswordButton, signInButton
                )
                .mainAxis(align: .spaceBetween)
            )
            .flexGrow(1),
            YGLayout.horizontal(
                signUpLabel, 4, signUpButton
            )
            .mainAxis(align: .center)
        )
        .paddingTop(44)
        .paddingHorizontal(16)
        .paddingBottom(12)
        .apply()
    }
    
}
