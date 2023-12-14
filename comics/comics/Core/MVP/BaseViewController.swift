//
//  BaseViewController.swift
//  comics
//
//  Created by Carlos Arismendy on 13/12/23.
//

import Foundation
import UIKit
import Lottie

class BaseViewController: UIViewController {
    
    var vSpinner: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    
    func loadingOn() {
        let spinnerView = UIView.init(frame: self.view.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.5)
        
        let size = 320
        let animationView = LottieAnimationView.init(name: "loading")
        let screenSize: CGRect = UIScreen.main.bounds
        let xValue = (Int(screenSize.width) / 2) - (size / 2)
        let yValue = (Int(screenSize.height) / 2) - (size / 2)
        animationView.frame = CGRect(x: xValue, y: yValue, width: size, height: size)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        animationView.play()
        
        spinnerView.addSubview(animationView)
        self.view.addSubview(spinnerView)
        vSpinner = spinnerView
    }
    
    func loadingOff() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }

    func showAlert(title: String = "ERROR", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            alert.dismiss(animated: true)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
