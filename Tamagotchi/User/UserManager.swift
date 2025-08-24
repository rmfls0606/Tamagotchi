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
    
    var currentUser: User?{
        return user
    }
    
    var isOnboarded: Bool{
        return user != nil
    }
    
    func createUser(imageName: String, name: String, introduction: String){
        let newUser = User(imageName: imageName, name: name, introduction: introduction)
        user = newUser
    }
    
    func updateUser(newUser: User){
        user = newUser
    }
    
    func updateNickname(nickname: String){
        guard var current = user else { return }
        current.nickName = nickname
        user = current
    }
}
