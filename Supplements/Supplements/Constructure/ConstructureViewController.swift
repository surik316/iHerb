//
//  ConstructureViewController.swift
//  Supplements
//
//  Created by Максим Сурков on 19.06.2021.
//

import Foundation
import UIKit

class ConstructureViewController: UIViewController {
    private lazy var model = ConstructureModel(self)
    private let imageView = UIImageView(image: UIImage(named: "background2"))
    private let tableView = UITableView()
    private let startCourse = UIButton()
    private var priceLabel = UILabel()
    private var price = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        view.addSubview(tableView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        setUptableView()
        startCourse.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startCourse)
        NSLayoutConstraint.activate([
            startCourse.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            startCourse.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startCourse.heightAnchor.constraint(equalToConstant: 62),
            startCourse.widthAnchor.constraint(equalToConstant: 319)
        ])
        startCourse.layer.cornerRadius = 34
        startCourse.backgroundColor = UIColor(red: 116/255, green: 170/255, blue: 74/255, alpha: 1)
        startCourse.setTitle("Начать курс", for: .normal)
        startCourse.titleLabel?.font =  UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        
        view.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.text = "\(price) р/мес"
        priceLabel.textAlignment = .center
		priceLabel.textColor = .white
		priceLabel.layer.cornerRadius = 10
		priceLabel.clipsToBounds = true
        
        priceLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 46),
            priceLabel.widthAnchor.constraint(equalToConstant: 160)
        ])

    }
    @objc func addButtonClick() {
        print("123")
    }
    @objc func analogButtonClick() {
        print("123")
    }
    private func setUptableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 25
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight =  131.0
        tableView.separatorStyle = .none
		tableView.showsVerticalScrollIndicator = false
        tableView.register(ConstructureTableViewCell.self, forCellReuseIdentifier: "ConstructureTableViewCell")
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
extension ConstructureViewController: UITableViewDelegate {
    
}
extension ConstructureViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 10
	}

	// There is just one row in every section
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	// Set the spacing between sections
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 10
	}

	// Make the background color show through
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerView = UIView()
		headerView.backgroundColor = UIColor.clear
		return headerView
	}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConstructureTableViewCell", for: indexPath) as! ConstructureTableViewCell
        cell.logoPillImageView.image = UIImage(named: "vitaminImage")
        cell.vitaminNameLabel.text = "Витамин С"
//        cell.priceLabel.text = "1 200 р/мес"
        cell.percentageLabel.text = "80%"
        cell.descriptionLabel.text = "California Gold Nutrition, Gold C, витамин C, 1000 мг, 60 вегетарианских капсул"
        cell.addButton.addTarget(self, action: #selector(addButtonClick), for: .touchUpInside)
        cell.analogsButton.addTarget(self, action: #selector(analogButtonClick), for: .touchUpInside)
        return cell
    }
    
}
