//
//  ViewController.swift
//  ExSetContentOffsetCompletion
//
//  Created by 김종권 on 2023/10/17.
//

import UIKit

class ViewController: UIViewController {
    private let upButton = {
        let button = UIButton()
        button.setTitle("Up", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let scrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    private let stackView = {
        let v = UIStackView()
        v.axis = .vertical
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    guard let self else { return }
                    let currentScrollOffsetY = scrollView.contentOffset.y
                    
//                    CATransaction.begin()
//                    CATransaction.setCompletionBlock({ print("complete!") })
//                    scrollView.setContentOffset(.init(x: 0, y: currentScrollOffsetY - 50), animated: true)
//                    CATransaction.commit()
                                                
                    scrollView.setContentOffset(.init(x: 0, y: currentScrollOffsetY - 50), animated: true)
                }
            ), for: .touchUpInside
        )
        
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(upButton)
        
        (0...50)
            .map { n in
                let l = UILabel()
                l.text = String(n)
                l.textColor = .black
                l.font = .systemFont(ofSize: 24)
                return l
            }
            .forEach(stackView.addArrangedSubview(_:))
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
        ])
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("end>>")
    }
}
