//
//  JobTypes.swift
//  JobApp
//
//

import Foundation

struct JobTypes {
 
     let slug: Int
  let companyName: Int
  let title: String
  let description: String
  let remote: Bool
  let url: String
  let tag: String
  let job_type: String
  let location: String
  let createdAt: String
  

    init(id: Int, userId: Int, name: String,urlVideo: String, description: String, thumbnailImage: String,createdAt: String, deletedAt: String, updatedAt : String) {
        self.id = id
        self.userId = userId
        self.name = name
        self.urlVideo = urlVideo
        self.description = description
        self.thumbnailImage = thumbnailImage
        self.createdAt = createdAt
        self.deletedAt = deletedAt
        self.updatedAt = updatedAt
        
       }

}
