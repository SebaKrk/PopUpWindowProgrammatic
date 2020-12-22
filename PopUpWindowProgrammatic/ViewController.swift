//
//  ViewController.swift
//  PopUpWindowProgrammatic
//
//  Created by Sebastian Sciuba on 21/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    var success = true
    
    lazy var popUpWindow : PopUpWindow = {
        let view = PopUpWindow()
        view.layer.cornerRadius = 5
        view.delegate = self
        
        return view
    }()
    
    let visualEfectView : UIVisualEffectView = {
        let blureEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blureEffect)
        return view
    }()
    
    let button : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Pop Up Window", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return button
    }()
    @objc func handleButton() {
        
        setUpPopUpWindowConstraints()
        
        popUpWindow.showSuccesMessage = success
        success = !success
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        
        setUpViewConstraints()
        
    }
    
    func setUpViewConstraints() {
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(visualEfectView)
        visualEfectView.translatesAutoresizingMaskIntoConstraints = false
        visualEfectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        visualEfectView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        visualEfectView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        visualEfectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEfectView.alpha = 0
    }
    
    func setUpPopUpWindowConstraints(){
        view.addSubview(popUpWindow)
        popUpWindow.translatesAutoresizingMaskIntoConstraints = false
        popUpWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popUpWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        popUpWindow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        popUpWindow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        popUpWindow.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        popUpWindow.alpha = 0
        
        UIView.animate(withDuration: 0.5) {
            self.visualEfectView.alpha = 1
            self.popUpWindow.alpha = 1
            self.popUpWindow.transform = CGAffineTransform.identity
        }
    }
}

extension ViewController: PopUpWindowDelegate {
    func dismisView() {
        UIView.animate(withDuration: 0.5) {
            self.visualEfectView.alpha = 0
            self.popUpWindow.alpha = 0
            self.popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { (_) in
            self.popUpWindow.removeFromSuperview()
        }
    }
    
    
}
// resources
// https://www.youtube.com/watch?v=GIELUwI3qio
// https://developer.apple.com/documentation/uikit/uiview/1622459-transform
// https://developer.apple.com/documentation/coregraphics/cgaffinetransform
// https://developer.apple.com/documentation/uikit/uivisualeffectview
