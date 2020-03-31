//
//  BTCityListViewController.swift
//  BTCityFinderSwift
//
//  Created by Ignacio on 28/02/2020.
//  Copyright © 2020 Ignacio. All rights reserved.
//

import UIKit

class BTCityListViewController: UIViewController {
    
    let kFileName = "cities";
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    var city: BTCityModel?
    var cityListManager: BTListManager!
    var citiesArray: [BTBaseModel] = []
    var citySearchArray: [BTBaseModel] = []
    var userStartedSearching: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureSearchBar()
        configureRefreshControll()
        
        cityListManager = BTListManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.showSpinner()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if citySearchArray.count > 0 || citiesArray.count > 0 {
            self.hideSpinner()
        } else {
            updateList()
        }
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureSearchBar() {
        searchBar.delegate = self
    }
    
    func configureRefreshControll() {
        refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor.lightGray
        refreshControl.tintColor = UIColor.white
        refreshControl.addTarget(self, action: #selector(updateList), for: .valueChanged)

        tableView.refreshControl = refreshControl
    }
    
    @objc func updateList() {
        let cityModelMgr = BTCityModelManager()
        
        cityListManager.getArrayForFile(file: kFileName, type: BTConstants.kFileType, modelManager: cityModelMgr) { [weak self](value, error) in
            DispatchQueue.main.async(execute: {
                if let strongSelf = self {
                    if value != nil {
                        strongSelf.citiesArray = BTArrayUtils.orderCityArrayByComposedName(array: value as! [BTCityModel])
                        strongSelf.tableView.reloadData()
                        strongSelf.hideSpinner()
                        strongSelf.refreshControl.endRefreshing()
                    } else {
                        strongSelf.hideSpinner()
                        
                        let alert = UIAlertController(title: BTConstants.kErrorTitle, message: "Connection failed", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                            strongSelf.dismiss(animated: true, completion: nil)
                        }))
                        strongSelf.present(alert, animated: true, completion: nil)
                    }
                }
            })
        }
    }
}

extension BTCityListViewController: UITableViewDelegate {
    
}

extension BTCityListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var rows = citiesArray.count
        if userStartedSearching {
            rows = citySearchArray.count;
        }
        return rows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell")
        
        if userStartedSearching {
            city = citySearchArray[indexPath.row] as? BTCityModel
        } else {
            city = citiesArray[indexPath.row] as? BTCityModel
        }
        
        cell?.textLabel?.text = city?.composedName
        cell?.detailTextLabel?.text = "Latitude: \(city?.coordDataModel?.latitude ?? 0), Longitude: \(city?.coordDataModel?.longitude ?? 0)"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO
    }
    
}

extension BTCityListViewController: UISearchBarDelegate {
    
}
