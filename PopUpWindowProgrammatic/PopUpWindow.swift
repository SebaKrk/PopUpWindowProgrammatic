//
//  PopUpWindow.swift
//  PopUpWindowProgrammatic
//
//  Created by Sebastian Sciuba on 21/12/2020.
//

import UIKit
protocol PopUpWindowDelegate {
    func dismisView()
}
class PopUpWindow: UIView {
    
    var delegate : PopUpWindowDelegate?
    
    var showSuccesMessage: Bool? {
        didSet{
            guard let success = showSuccesMessage else {return}
            if success {
                checkLabel.text = "✓"
                checkLabel.textColor = .green
                notificationLabel.text = "Success"
                
            } else {
                checkLabel.text = "X"
                checkLabel.textColor = .red
                notificationLabel.text = "Error"
            }
        }
    }
    
    let checkLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 96)
        return label
    }()
    let notificationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    let okButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("OK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleOkButton), for: .touchUpInside)
        return button
    }()
    
    @objc func handleOkButton () {
        print("dismis")
        delegate?.dismisView()
      
    }

//    MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        setUpViewConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    MARK: - SetUP View Constrains
    
    func setUpViewConstrains() {
        
        addSubview(checkLabel)
        checkLabel.translatesAutoresizingMaskIntoConstraints = false
        checkLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        checkLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -28).isActive = true
        
        addSubview(notificationLabel)
        notificationLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationLabel.topAnchor.constraint(equalTo: checkLabel.bottomAnchor,constant: 20).isActive = true
        notificationLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(okButton)
        okButton.translatesAutoresizingMaskIntoConstraints = false
        okButton.topAnchor.constraint(equalTo: notificationLabel.bottomAnchor, constant: 20).isActive = true
        okButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        okButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30).isActive = true
        okButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
}
