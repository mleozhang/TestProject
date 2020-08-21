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


class HomeViewController: UIViewController {

    var centerTextView:UITextView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: {
            timer in
            self.reqGetData()
        })
        self.initNavBtn()
        self.initTextView()
        self.loadlocalFirstData()
    }
    
    private func loadlocalFirstData()
    {
       if let localData:[Data] = (FileUtils.loadRecordFromDisk())
       {
        if(localData.count>0)
        {
            let firstData=localData[0]
            let jsonData=try?JSON.init(data: firstData)
            self.centerTextView?.text=jsonData?.rawString()
        }
        }
        
    }
    
    private func initTextView()
    {
        centerTextView=UITextView(frame: CGRect(x: 30,y: 140,width: UIScreen.main.bounds.width-60,height: UIScreen.main.bounds.height-180))
        centerTextView?.backgroundColor=UIColor.lightGray
        centerTextView?.isEditable=false
        centerTextView?.isSelectable=false
        self.view.addSubview((centerTextView)!)
    }
    
    private func initNavBtn()
    {
        let rightItem=UIBarButtonItem()
        let barBtn=UIButton()
        barBtn.addTarget(self, action:#selector(historyAction) , for: UIControl.Event.touchUpInside)
        barBtn.setTitle("请求历史", for: UIControl.State.normal)
        barBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        rightItem.customView=barBtn;
        self.navigationItem.rightBarButtonItem=rightItem;
    }
    
    @objc func historyAction()
    {
        let historyVC=HistoryViewController()
        self.navigationController?.pushViewController(historyVC, animated: true)
    }

    private func  reqGetData()
    {
        let parameters:Dictionary = ["":""]
        Alamofire.request("https://api.github.com/",method: HTTPMethod.get,  parameters: parameters)
        .responseJSON { response in
            print("result==\(response.result)")   // 返回结果，是否成功
            if let jsonValue = response.result.value {
                let jsonObj=JSON(jsonValue)
                let data = try?jsonObj.rawData()
                self.centerTextView?.text=jsonObj.rawString()
                FileUtils.saveToDisk(data: data!)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "hasNewDataItemNotification"), object: data)
            }
    }
    }
    
   
    
    
}

