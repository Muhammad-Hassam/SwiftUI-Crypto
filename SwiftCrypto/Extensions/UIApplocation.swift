//
//  UIApplocation.swift
//  SwiftCrypto
//
//  Created by Hassam Shaikh on 24/03/2025.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
