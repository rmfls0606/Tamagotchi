//
//  UserManager.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/24/25.
//

import Foundation

final class UserManager {
    
    static let shared = UserManager()
    
    private init() {}
    
    @UserDefault(key: .user) private var user: User?
    
    var isOnboarded: Bool{
        return user != nil
    }
    
    func createUser(imageName: String, introduction: String){
        let newUser = User(imageName: imageName, introduction: introduction)
        user = newUser
    }
}
