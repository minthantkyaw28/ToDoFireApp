//
//  User.swift
//  ToDo
//
//  Created by MTK on 07/06/2023.
//

import Foundation

struct User : Codable{
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval
}
