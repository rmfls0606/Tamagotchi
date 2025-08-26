//
//  BaseViewModel.swift
//  Tamagotchi
//
//  Created by 이상민 on 8/26/25.
//

import Foundation

protocol BaseViewModel{
    associatedtype Input
    associatedtype output
    
    func transform(input: Input) -> output
}
