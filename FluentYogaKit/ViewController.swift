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
        print("signUpButton did tap !!!")
    }

    fileprivate func applyLayout() {
        let formView = UIView()
//        .then {
////            $0.backgroundColor = .white
//        }
        
        view.sv(
            titleLabel,
            formView.sv(
                usernameLabel, usernameTextField,
                passwordLabel, passwordTextField,
                forgotPasswordButton, signInButton
            ),
            signUpLabel, signUpButton
        )
        
        
        let headerLayout = YGLayoutView(view: titleLabel)
        
        let usernameLabelLayout = YGLayoutView(view: usernameLabel)
        let usernameTextFieldLayout = YGLayoutView(view: usernameTextField)
        let passwordLabelLayout = YGLayoutView(view: passwordLabel)
        let passwordTextFieldLayout = YGLayoutView(view: passwordTextField)
        
        let forgotPasswordLayout = YGLayoutView(view: forgotPasswordButton)
        let signInLayout = YGLayoutView(view: signInButton)
        let formButtonsLayout = YGLayoutElement(horizontal: forgotPasswordLayout, signInLayout)
        
        let formLayout = YGLayoutView(view: formView, vertical:
            usernameLabelLayout,
            usernameTextFieldLayout,
            passwordLabelLayout,
            passwordTextFieldLayout,
            formButtonsLayout
        )
        
        let signUpLabelLayout = YGLayoutView(view: signUpLabel)
        let signUpButtonLayout = YGLayoutView(view: signUpButton)
        let footerLayout = YGLayoutElement(horizontal: signUpLabelLayout, signUpButtonLayout)
        
        let rootLayout = YGLayoutView(view: view, vertical:
            headerLayout,
            formLayout,
            footerLayout
        )
        
        rootLayout
            .isEnabled(true)
            .paddingHorizontal(16)
        
        headerLayout
            .isEnabled(true)
            .crossSelf(.flexStart)
            .marginTop(44)
        
        formLayout
            .isEnabled(true)
            .flexGrow(1)
        usernameLabelLayout
            .isEnabled(true)
            .marginTop(30)
        usernameTextFieldLayout
            .isEnabled(true)
            .marginTop(8)
        passwordLabelLayout
            .isEnabled(true)
            .marginTop(12)
        passwordTextFieldLayout
            .isEnabled(true)
            .marginTop(8)
        
        formButtonsLayout
            .isEnabled(true)
            .mainAxis(.spaceBetween)
            .marginTop(16)
        
        footerLayout
            .isEnabled(true)
            .mainAxis(.center)
            .marginBottom(12)
        signUpButtonLayout
            .isEnabled(true)
            .marginLeft(4)
        
        rootLayout.layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameTextField.border(sides: .bottom)
        passwordTextField.border(sides: .bottom)
    }
}
