//
//  HomePageView.swift
//  SampleTest
//
//  Created by Spandana Nayakanti on 6/21/19.
//  Copyright © 2019 Spandana. All rights reserved.
//

import UIKit

class HomePageView: UIView,UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet var contentView: UIView!
    @IBOutlet var userDataTableView: UITableView!
    var dataArray: [HomePageModel.User] = []
    let homePageModel: HomePageViewModel = HomePageViewModel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        laodView()
        registerNibs()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func laodView() {
        userDataTableView.delegate = self
        userDataTableView.dataSource = self
        homePageModel.getUserData { (model) in
            self.dataArray = model
            DispatchQueue.main.async { [weak self] in
                self?.userDataTableView.reloadData()
            }
        }
    }
    
    private func registerNibs() {
        userDataTableView.register(UINib(nibName: "HomePageTableViewCell", bundle: nil), forCellReuseIdentifier: "cellID")
    }
    
    private func loadNib() {
        Bundle.main.loadNibNamed("HomePageView", owner: self, options: nil)
        addSubview(contentView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as? HomePageTableViewCell else { return UITableViewCell() }
        let contact = dataArray[indexPath.row]
        cell.firstName.text = contact.firstName
        cell.lastName.text = contact.lastName
        cell.phoneNumber.text = contact.phoneNumber
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
}
