//
//  SigninViewController.swift
//  firebase
//
//  Created by Mac on 22/03/2024.
//

import UIKit
import Firebase
import GoogleSignIn

class SigninViewController: UIViewController {
    
    var signinButton: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }
    
    func updateUi() {
        configureGidc()
        setupCustomButton()
        setupViews()
    }
    
    func configureGidc() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
    }
    
    func setupCustomButton() {
        signinButton = GIDSignInButton()
        signinButton.style = .wide
        signinButton.addTarget(self, action: #selector(signinBtnPressed), for: .touchUpInside)
        signinButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupViews() {
        view.addSubview(signinButton)
        signinButton.addTarget(self, action: #selector(signinBtnPressed), for: .touchUpInside)
        NSLayoutConstraint.activate([
            signinButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            signinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signinButton.heightAnchor.constraint(equalToConstant: 45),
            signinButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc func signinBtnPressed() {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [weak self] result, error in
            guard let strongSelf = self else {return}
            guard error == nil else {
                print("Google Sign-In error: \(error!.localizedDescription)")
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase Sign-In error: \(error.localizedDescription)")
                    return
                }
                let vc = ViewController()
                vc.modalPresentationStyle = .fullScreen
                self?.present(vc, animated: true)
                //strongSelf.navigationController?.dismiss(animated: true)
            }
        }
    }
}
