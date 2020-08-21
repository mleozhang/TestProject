//
//  FileUtils.swift
//  TestProject
//
//  Created by Leo on 2020/8/20.
//  Copyright © 2020 Leo. All rights reserved.
//

import UIKit

/*
 *文件管理类,数据以Data类型存储在文件中
 */
class FileUtils: NSObject {
    
   static var filePath=NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/history.dat";
    
    
   static func saveToDisk(data:Data)
    {
        var localData:[Data]?
        if(!self.fileExist(path: filePath))
        {
            localData=[Data]()
        }
        else
        {
            localData = (NSKeyedUnarchiver.unarchiveObject(withFile: FileUtils.filePath) as? [Data])!
        }
        localData?.insert(data, at: 0)
        NSKeyedArchiver.archiveRootObject(localData, toFile: FileUtils.filePath)
    }
    
    static func loadRecordFromDisk() -> [Data]?
    {
        if(!self.fileExist(path: filePath))
        {
            return nil;
        }
        let data : [Data] = (NSKeyedUnarchiver.unarchiveObject(withFile: FileUtils.filePath) as? [Data])!
        return data;
    }
    
   
    
   static func fileExist(path:String)->Bool
    {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path) {
            return true
        } else {
            return false
        }
        
    }
}
