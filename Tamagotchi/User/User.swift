//
//  User.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/24/25.
//

import Foundation

enum UserDefaultKey: String{
    case user
}

struct User: Codable{
    var imageName: String
    var name: String = "대장"
    var introduction: String
    var level: Int = 1
    var riceCount: Int = 0
    var waterCount: Int = 0
}

@propertyWrapper
struct UserDefault<T: Codable>{
    let key: String
    let defaults = UserDefaults.standard
    
    init(key: UserDefaultKey) {
        self.key = key.rawValue
    }
    
    var wrappedValue: T? {
        get {
            guard let data = defaults.data(forKey: key) else { return nil}
            return try? JSONDecoder().decode(T.self, from: data)
        }
        set {
            if let value = newValue{
                guard let data = try? JSONEncoder().encode(value) else{ return }
                defaults.set(data, forKey: key)
            }else{
                defaults.removeObject(forKey: key)
            }
        }
    }
}
