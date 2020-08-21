//
//  DataModule.swift
//  TestProject
//
//  Created by Leo on 2020/8/20.
//  Copyright © 2020 Leo. All rights reserved.
//
/*
 *数据模型
 */
import UIKit

class DataModule: NSObject,NSCoding,Decodable,NSSecureCoding {
    static var supportsSecureCoding: Bool = true

    
    func encode(with coder: NSCoder) {
        coder.encode(current_user_authorizations_html_url)
        coder.encode(authorizations_url)
        coder.encode(code_search_url)
        coder.encode(commit_search_url)
        coder.encode(emails_url)
        coder.encode(emojis_url)
        coder.encode(events_url)
        coder.encode(feeds_url)
        coder.encode(followers_url)
        coder.encode(following_url)
        coder.encode(gists_url)
        coder.encode(hub_url)
        coder.encode(issue_search_url)
        coder.encode(issues_url)
        coder.encode(label_search_url)
        coder.encode(notifications_url)
        coder.encode(organization_url)
        coder.encode(organization_repositories_url)
        coder.encode(organization_teams_url)
        coder.encode(public_gists_url)
        coder.encode(rate_limit_url)
        coder.encode(repository_url)
        coder.encode(repository_search_url)
        coder.encode(current_user_repositories_url)
        coder.encode(starred_url)
        coder.encode(starred_gists_url)
        coder.encode(user_url)
        coder.encode(user_organizations_url)
        coder.encode(user_repositories_url)
        coder.encode(user_search_url)
    }
    
    required init?(coder: NSCoder) {
        coder.decodeObject(forKey: "current_user_authorizations_html_url") as! String
        coder.decodeObject(forKey: "authorizations_url")
        coder.decodeObject(forKey: "code_search_url")
        coder.decodeObject(forKey: "commit_search_url")
        coder.decodeObject(forKey: "emails_url")
        coder.decodeObject(forKey: "emojis_url")
        coder.decodeObject(forKey: "events_url")
        coder.decodeObject(forKey: "feeds_url")
        coder.decodeObject(forKey: "followers_url")
        coder.decodeObject(forKey: "following_url")
        coder.decodeObject(forKey: "gists_url")
        coder.decodeObject(forKey: "hub_url")
        coder.decodeObject(forKey: "issue_search_url")
        coder.decodeObject(forKey: "issues_url")
        coder.decodeObject(forKey: "label_search_url")
        coder.decodeObject(forKey: "notifications_url")
        coder.decodeObject(forKey: "organization_url")
        coder.decodeObject(forKey: "organization_repositories_url")
        coder.decodeObject(forKey: "organization_teams_url")
        coder.decodeObject(forKey: "public_gists_url")
        coder.decodeObject(forKey: "rate_limit_url")
        coder.decodeObject(forKey: "repository_url")
        coder.decodeObject(forKey: "repository_search_url")
        coder.decodeObject(forKey: "current_user_repositories_url")
        coder.decodeObject(forKey: "starred_url")
        coder.decodeObject(forKey: "starred_gists_url")
        coder.decodeObject(forKey: "user_url")
        coder.decodeObject(forKey: "user_organizations_url")
        coder.decodeObject(forKey: "user_repositories_url")
        coder.decodeObject(forKey: "user_search_url")
    }
    
    var current_user_authorizations_html_url: String?
    var authorizations_url: String?
    var code_search_url: String?
    var commit_search_url: String?
    var emails_url: String?
    var emojis_url: String?
    var events_url: String?
    var feeds_url: String?
    var followers_url: String?
    var following_url: String?
    var gists_url: String?
    var hub_url: String?
    var issue_search_url: String?
    var issues_url: String?
    var label_search_url: String?
    var notifications_url: String?
    var organization_url: String?
    var organization_repositories_url: String?
    var organization_teams_url: String?
    var public_gists_url: String?
    var rate_limit_url: String?
    var repository_url: String?
    var repository_search_url: String?
    var current_user_repositories_url: String?
    var starred_url: String?
    var starred_gists_url: String?
    var user_url: String?
    var user_organizations_url: String?
    var user_repositories_url: String?
    var user_search_url: String?
    
   
}
