//
//  RepositoryDetailsVCTests.swift
//  GithubRepositoriesTests
//
//  Created by Ростислав on 2/25/18.
//  Copyright © 2018 Ростислав. All rights reserved.
//

import XCTest
@testable import GithubRepositories

class RepositoryDetailsVCTests: XCTestCase {
    
    // Variables
    var repositoryDetailsVC: RepositoryDetailsVC!
    var repository: Repository!
    
    override func setUp() {
        super.setUp()
        repositoryDetailsVC = RepositoryDetailsVC()
        repository = try! Repository(repositoryJSON)
    }
    
    override func tearDown() {
        super.tearDown()
        repositoryDetailsVC = nil
    }
    
    func testRepositoryDetailsVCConfigureViewModelRepositoryNotNil() {
        repositoryDetailsVC.configure(with: repository)
        
        XCTAssertTrue(repositoryDetailsVC.viewModel.repository != nil)
    }
    
    let repositoryJSON = """
            {
                "id": 2203645,
                "name": "CocoaPods",
                "full_name": "CocoaPods/CocoaPods",
                "owner": {
                "login": "CocoaPods",
                "id": 1189714,
                "avatar_url": "https://avatars1.githubusercontent.com/u/1189714?v=4",
                "gravatar_id": "",
                "url": "https://api.github.com/users/CocoaPods",
                "html_url": "https://github.com/CocoaPods",
                "followers_url": "https://api.github.com/users/CocoaPods/followers",
                "following_url": "https://api.github.com/users/CocoaPods/following{/other_user}",
                "gists_url": "https://api.github.com/users/CocoaPods/gists{/gist_id}",
                "starred_url": "https://api.github.com/users/CocoaPods/starred{/owner}{/repo}",
                "subscriptions_url": "https://api.github.com/users/CocoaPods/subscriptions",
                "organizations_url": "https://api.github.com/users/CocoaPods/orgs",
                "repos_url": "https://api.github.com/users/CocoaPods/repos",
                "events_url": "https://api.github.com/users/CocoaPods/events{/privacy}",
                "received_events_url": "https://api.github.com/users/CocoaPods/received_events",
                "type": "Organization",
                "site_admin": false
                },
                "private": false,
                "html_url": "https://github.com/CocoaPods/CocoaPods",
                "description": "The Cocoa Dependency Manager.",
                "fork": false,
                "url": "https://api.github.com/repos/CocoaPods/CocoaPods",
                "forks_url": "https://api.github.com/repos/CocoaPods/CocoaPods/forks",
                "keys_url": "https://api.github.com/repos/CocoaPods/CocoaPods/keys{/key_id}",
                "collaborators_url": "https://api.github.com/repos/CocoaPods/CocoaPods/collaborators{/collaborator}",
                "teams_url": "https://api.github.com/repos/CocoaPods/CocoaPods/teams",
                "hooks_url": "https://api.github.com/repos/CocoaPods/CocoaPods/hooks",
                "issue_events_url": "https://api.github.com/repos/CocoaPods/CocoaPods/issues/events{/number}",
                "events_url": "https://api.github.com/repos/CocoaPods/CocoaPods/events",
                "assignees_url": "https://api.github.com/repos/CocoaPods/CocoaPods/assignees{/user}",
                "branches_url": "https://api.github.com/repos/CocoaPods/CocoaPods/branches{/branch}",
                "tags_url": "https://api.github.com/repos/CocoaPods/CocoaPods/tags",
                "blobs_url": "https://api.github.com/repos/CocoaPods/CocoaPods/git/blobs{/sha}",
                "git_tags_url": "https://api.github.com/repos/CocoaPods/CocoaPods/git/tags{/sha}",
                "git_refs_url": "https://api.github.com/repos/CocoaPods/CocoaPods/git/refs{/sha}",
                "trees_url": "https://api.github.com/repos/CocoaPods/CocoaPods/git/trees{/sha}",
                "statuses_url": "https://api.github.com/repos/CocoaPods/CocoaPods/statuses/{sha}",
                "languages_url": "https://api.github.com/repos/CocoaPods/CocoaPods/languages",
                "stargazers_url": "https://api.github.com/repos/CocoaPods/CocoaPods/stargazers",
                "contributors_url": "https://api.github.com/repos/CocoaPods/CocoaPods/contributors",
                "subscribers_url": "https://api.github.com/repos/CocoaPods/CocoaPods/subscribers",
                "subscription_url": "https://api.github.com/repos/CocoaPods/CocoaPods/subscription",
                "commits_url": "https://api.github.com/repos/CocoaPods/CocoaPods/commits{/sha}",
                "git_commits_url": "https://api.github.com/repos/CocoaPods/CocoaPods/git/commits{/sha}",
                "comments_url": "https://api.github.com/repos/CocoaPods/CocoaPods/comments{/number}",
                "issue_comment_url": "https://api.github.com/repos/CocoaPods/CocoaPods/issues/comments{/number}",
                "contents_url": "https://api.github.com/repos/CocoaPods/CocoaPods/contents/{+path}",
                "compare_url": "https://api.github.com/repos/CocoaPods/CocoaPods/compare/{base}...{head}",
                "merges_url": "https://api.github.com/repos/CocoaPods/CocoaPods/merges",
                "archive_url": "https://api.github.com/repos/CocoaPods/CocoaPods/{archive_format}{/ref}",
                "downloads_url": "https://api.github.com/repos/CocoaPods/CocoaPods/downloads",
                "issues_url": "https://api.github.com/repos/CocoaPods/CocoaPods/issues{/number}",
                "pulls_url": "https://api.github.com/repos/CocoaPods/CocoaPods/pulls{/number}",
                "milestones_url": "https://api.github.com/repos/CocoaPods/CocoaPods/milestones{/number}",
                "notifications_url": "https://api.github.com/repos/CocoaPods/CocoaPods/notifications{?since,all,participating}",
                "labels_url": "https://api.github.com/repos/CocoaPods/CocoaPods/labels{/name}",
                "releases_url": "https://api.github.com/repos/CocoaPods/CocoaPods/releases{/id}",
                "deployments_url": "https://api.github.com/repos/CocoaPods/CocoaPods/deployments",
                "created_at": "2011-08-14T00:10:53Z",
                "updated_at": "2018-02-25T05:49:18Z",
                "pushed_at": "2018-02-23T22:32:50Z",
                "git_url": "git://github.com/CocoaPods/CocoaPods.git",
                "ssh_url": "git@github.com:CocoaPods/CocoaPods.git",
                "clone_url": "https://github.com/CocoaPods/CocoaPods.git",
                "svn_url": "https://github.com/CocoaPods/CocoaPods",
                "homepage": "https://cocoapods.org/",
                "size": 55465,
                "stargazers_count": 10262,
                "watchers_count": 10262,
                "language": "Ruby",
                "has_issues": true,
                "has_projects": true,
                "has_downloads": true,
                "has_wiki": true,
                "has_pages": false,
                "forks_count": 1882,
                "mirror_url": null,
                "archived": false,
                "open_issues_count": 106,
                "license": {
                "key": "other",
                "name": "Other",
                "spdx_id": null,
                "url": null
                },
                "forks": 1882,
                "open_issues": 106,
                "watchers": 10262,
                "default_branch": "master",
                "permissions": {
                "admin": false,
                "push": false,
                "pull": true
                }
            }
            """
    
}

