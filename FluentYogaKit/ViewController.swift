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

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let redView = UIView()
//        let greenView = UIView()
//        let blueView = UIView()
//
//        redView.backgroundColor = .red
//        greenView.backgroundColor = .green
//        blueView.backgroundColor = .blue
//
//        view.sv(
//            redView,
//            greenView, blueView
//        )
//        
//        let redLayout = YGLayoutView(view: redView)
//        let greenLayout = YGLayoutView(view: greenView)
//        let blueLayout = YGLayoutView(view: blueView)
//        
//        let bottomLayout = YGLayoutElement(horizontal: greenLayout, blueLayout)
//        let rootLayout = YGLayoutView(view: view, vertical: redLayout, bottomLayout)
//        
//        rootLayout
//            .isEnabled(true)
//            .mainAxis(.spaceBetween)
//            .crossAxis(.center)
//        
//        redLayout
//            .isEnabled(true)
//            .size(width: 56, height: 56)
//        greenLayout
//            .isEnabled(true)
//            .size(width: 56, height: 56)
//            .marginRight(10)
//        blueLayout
//            .isEnabled(true)
//            .size(width: 56, height: 56)
//
//        bottomLayout
//            .isEnabled(true)
//            .mainAxis(.center)
//            .crossAxis(.center)
////            .crossSelf(.flexEnd)
//            .marginBottom(30)
//        
//        rootLayout.layout()
//        
//    }

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
    }

    @objc fileprivate func signInButtonDidTap() {
        print("signInButton did tap !!!")
    }

    fileprivate func applyLayout() {
        
        
        let formView = UIView()
//        .then {
////            $0.backgroundColor = .white
//        }
        let formLayout = YGLayoutView(view: formView)
        
        let rootLayout = YGLayoutView(view: view)
            .sublayout(
                |titleLabel|.crossSelf(.flexStart),
                30,
                formLayout.sublayout(
                    usernameLabel,
                    8,
                    usernameTextField,
                    16,
                    passwordLabel,
                    8,
                    passwordTextField,
                    16,
                    |forgotPasswordButton-signInButton|
                )
                .flexGrow(1),
                |signUpLabel-4-signUpButton|
            )
        
        rootLayout
            .isEnabled(true)
            .paddingTop(44)
            .paddingHorizontal(16)
            .paddingBottom(12)
        
        
        formLayout[4]! // form buttons
            .mainAxis(.spaceBetween)
        
        rootLayout[2]! // footer
            .mainAxis(.center)
        
        rootLayout.layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameTextField.border(sides: .bottom)
        passwordTextField.border(sides: .bottom)
    }
}
