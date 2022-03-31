//
//  JobModel.swift
//  JobApp
//

import Foundation

struct JobModel {
 let slug: String
  let companyName: String
  let title: String
  let description: String
  let remote: String
  let url: String
  let location: String
  let createdAt: String
  

    init(slug: String, companyName: String, title: String,description: String, remote: String, url: String, location : String, createdAt : String) {
        self.slug = slug
        self.companyName = companyName
        self.title = title
        self.description = description
        self.remote = remote
        self.url = url
        self.location = location
        self.createdAt = createdAt
       }
}
