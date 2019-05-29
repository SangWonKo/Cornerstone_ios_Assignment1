//
//  ViewController.swift
//  Assignment1Starter
//
//  Created by 고상원 on 2019-04-17.
//  Copyright © 2019 고상원. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 1. create a mainview
    let mainView: UIView = {
        let v = UIView()
        // important when setting constraints programmatically
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .green
        return v
    }()
    
    let blueView1: UIView = {
        let v = UIView()
        // important when setting constraints programmatically
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .blue
        return v
    }()
    let blueView2: UIView = {
        let v = UIView()
        // important when setting constraints programmatically
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .blue
        return v
    }()
    let blueView3: UIView = {
        let v = UIView()
        // important when setting constraints programmatically
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .blue
        return v
    }()
    
    let purpleView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .purple
        return v
    }()
    
    let redView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
        let orangeView1 = UIView(frame: CGRect(x: 10, y: 10, width: 120, height: 40))
        let orangeView2 = UIView(frame: CGRect(x: 140, y: 10, width: 70, height: 40))
        orangeView1.backgroundColor = .orange
        orangeView2.backgroundColor = .orange
        
        v.addSubview(orangeView1)
        v.addSubview(orangeView2)
        return v
        
    }()
    
    
    // 2. create 3 buttons
    let squareButt: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Square", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
        
        return butt
    }()
    let portraitButt: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Portrait", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
        
        
        return butt
    }()
    let landscapeButt: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Lanscape", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
        
        
        return butt
    }()
    
    var widthAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?

    fileprivate func setupLayout() {
        // set constraints for mainview (x,y,w,h)
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        widthAnchor?.isActive = true
        heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        heightAnchor?.isActive = true
        
        // set constraints for blue view
        
        blueView1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blueView1.widthAnchor.constraint(equalToConstant: 70).isActive = true
        blueView1.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        blueView2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blueView2.widthAnchor.constraint(equalToConstant:70).isActive = true
        blueView2.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        blueView3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blueView3.widthAnchor.constraint(equalToConstant: 70).isActive = true
        blueView3.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        purpleView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20).isActive = true
        purpleView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        purpleView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.7).isActive = true
        purpleView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        redView.widthAnchor.constraint(equalToConstant: 220).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        redView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true
        redView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true

        
        // create a stackview
        let buttStackView = UIStackView(arrangedSubviews: [squareButt, portraitButt, landscapeButt])
        buttStackView.translatesAutoresizingMaskIntoConstraints = false
        buttStackView.axis = .horizontal
        buttStackView.distribution = .fillEqually
        buttStackView.alignment = .center
        
        view.addSubview(buttStackView)
        
        // 4. setup constraints for the stackview (center horizontally, pinned to bottom, set width & height) ( pinned to left, right, bottom, give a height)
        NSLayoutConstraint.activate([
            buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            buttStackView.heightAnchor.constraint(equalToConstant: 50),
            ])
        
        let blueStackView = UIStackView(arrangedSubviews: [blueView1,blueView2,blueView3])
        blueStackView.translatesAutoresizingMaskIntoConstraints = false
        blueStackView.axis = .vertical
        blueStackView.distribution = .equalSpacing
        blueStackView.alignment = .center
        
        mainView.addSubview(blueStackView)
    
        blueStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        blueStackView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        blueStackView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.5).isActive = true
        blueStackView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.7).isActive = true
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(mainView)
        view.addSubview(blueView1)
        view.addSubview(blueView2)
        view.addSubview(blueView3)
        mainView.addSubview(purpleView)
        mainView.addSubview(redView)
        
        setupLayout()

    }
    
    @objc private func squareTapped() {
        // 5. animate mainview(square)
        //  - change width constraint ( w: 80% w, h: 80% w )
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            //what you want to animate
            self.widthAnchor?.isActive = false
            self.widthAnchor = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.heightAnchor?.isActive = true
            //change the properties
            self.view.layoutIfNeeded()
        }
    }
    @objc private func portraitTapped() {
        // 5. animate mainview(portrait)
        //  - change width, height constraint ( w: 80% w, h: 80% h)
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            //what you want to animate
            self.widthAnchor?.isActive = false
            self.widthAnchor = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            self.heightAnchor?.isActive = true
            
            //change the properties
            self.view.layoutIfNeeded()
        }
    }
    @objc private func landscapeTapped() {
        // 5. animate mainview(landscape)
        //  - change width constraint ( w: 95% w, h: 40% h)
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.40)
            self.heightAnchor?.isActive = true
            //change the properties
            self.view.layoutIfNeeded()
        }
    }


}

