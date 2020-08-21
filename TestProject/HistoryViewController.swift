//
//  ViewController.swift
//  TestProject
//
//  Created by Leo on 2020/8/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class HistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var mTableView:UITableView?
    var data = [DataModule]()
    var rightBtn:UIButton?
    var refreshControl:UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.red;
        // Do any additional setup after loading the view.
        self.initTableView()
        self.navigationItem.title="请求记录"
        NotificationCenter.default.addObserver(self, selector: #selector(insertNewItem(noti:)), name:NSNotification.Name(rawValue: "hasNewDataItemNotification"), object: nil)
        self.initRightBarBtn()
    }

   private func initRightBarBtn()
    {
        rightBtn=UIButton()
        rightBtn?.setTitle("有新数据", for: UIControl.State.normal)
        rightBtn?.setTitleColor(UIColor.red, for: UIControl.State.normal)
        rightBtn?.addTarget(self, action: #selector(rightBarAction), for: UIControl.Event.touchUpInside)
        let rightBarItem=UIBarButtonItem()
        rightBarItem.customView=rightBtn;
        rightBtn?.isHidden=true
        self.navigationItem.rightBarButtonItem=rightBarItem;
        
        let leftBtn=UIButton()
        leftBtn.setTitle("返回", for: UIControl.State.normal)
        leftBtn.setTitleColor(UIColor.red, for: UIControl.State.normal)
        leftBtn.addTarget(self, action: #selector(leftBarAction), for: UIControl.Event.touchUpInside)
        let leftBarItem=UIBarButtonItem()
        leftBarItem.customView=leftBtn;
        leftBtn.isHidden=true
        self.navigationItem.backBarButtonItem=leftBarItem;
    }
    
    @objc func leftBarAction()
    {
        self.refreshControl?.beginRefreshing()
        self.refreshNewData()
        self.rightBtn?.isHidden=true
    }
    
    @objc func rightBarAction()
    {
        self.refreshControl?.beginRefreshing()
        self.refreshNewData()
        self.rightBtn?.isHidden=true
    }
    
    /*
     *数据更新通知，可以在有一条新数据的时候插入列表
     */
    @objc func insertNewItem(noti : Notification)
    {
//        let itemData=noti.object as! Data
//        let decoder = JSONDecoder()
//        let module:DataModule = try! decoder.decode(DataModule.self, from: itemData)
//        data.insert(module, at: 0)
//        self.mTableView?.beginUpdates()
//        self.mTableView?.insertRows(at: [IndexPath.init(row: 0, section: 0)], with: UITableView.RowAnimation.fade)
//        self.mTableView?.endUpdates()
        self.rightBtn?.isHidden=false
    }
    
    
   private func initTableView()
    {
        for moduleData in FileUtils.loadRecordFromDisk()!
        {
            let decoder = JSONDecoder()
            let module:DataModule = try! decoder.decode(DataModule.self, from: moduleData)
            data.append(module)
        }
        
        mTableView=UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        self.view.addSubview(mTableView!)
        self.mTableView?.delegate=self;
        self.mTableView?.dataSource=self;
        
        //刷新控件
        refreshControl=UIRefreshControl.init(frame:CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: 150))
        refreshControl?.tintColor=UIColor.red//
        refreshControl?.attributedTitle=NSAttributedString.init(string:"")//
        self.mTableView?.addSubview((self.refreshControl)!)
        self.refreshControl!.addTarget(self, action: #selector(refreshNewData),
        for: .valueChanged)


    }
    
    @objc func refreshNewData()
    {
        for moduleData in FileUtils.loadRecordFromDisk()!
        {
            let decoder = JSONDecoder()
            let module:DataModule = try! decoder.decode(DataModule.self, from: moduleData)
            data.append(module)
        }
        self.mTableView?.reloadData()
        self.refreshControl?.endRefreshing()
        self.mTableView?.scrollToRow(at: IndexPath.init(row: 0, section: 0), at: UITableView.ScrollPosition.top, animated: true)
        self.rightBtn?.isHidden=true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseId="historyReuseId"
        let cell=UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseId)
        let module=data[indexPath.row]
        cell.textLabel?.text=module.authorizations_url
        return cell;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    
}

