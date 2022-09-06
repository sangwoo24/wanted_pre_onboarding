//
//  NSObject.swift
//  wanted_pre_onboarding
//
//  Created by Jerry on 2022/09/06.
//

import Foundation

extension NSObject {
    class var reuseIdentifier: String {
        return String(describing: self)
    }
}
