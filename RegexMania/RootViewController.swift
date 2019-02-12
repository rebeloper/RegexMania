//
//  RootViewController.swift
//  TestingRegexMania
//
//  Created by Alex Nagy on 12/02/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import TinyConstraints

class RootViewController: UIViewController {
    
    let validityType: String.ValidityType = .website
    
    lazy var textField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.placeholder = "Type in your \(validityType)..."
        tf.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return tf
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupViews()
    }
    
    fileprivate func setupViews() {
        navigationItem.title = "Regex Mania"
        view.backgroundColor = .white
        
        view.addSubview(textField)
        view.addSubview(label)
        
        textField.edgesToSuperview(excluding: .bottom, insets: .top(12) + .left(12) + .right(12), usingSafeArea: true)
        textField.height(36)
        
        label.centerXToSuperview()
        label.topToBottom(of: textField, offset: 12)
    }
    
    @objc fileprivate func handleTextChange() {
        guard let text = textField.text else { return }
        if text.isValid(validityType) {
            label.text = "Valid \(validityType)"
        } else {
            label.text = "Not a valid \(validityType)"
        }
    }
}

