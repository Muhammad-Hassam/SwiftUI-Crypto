//
//  Double.swift
//  SwiftCrypto
//
//  Created by Hassam Shaikh on 17/03/2025.
//

import Foundation

extension Double {
    
    
    
    /// Converts a Double into a Currency with 2-6 decimal places
    ///  ```
    /// Coverts 1234.56 to $1,234.56
    /// Coverts 12.3456 to $12.3456
    /// Coverts 0.123456 to $0.123456
    ///  ```
    private var currencyFormatter6 : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current <- defaul value
//        formatter.currencyCode = "usd"  <- defaul value
//        formatter.currencySymbol = "$" <- defaul value
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converts a Double into a Currency as a string with 2-6 decimal places
    ///  ```
    /// Coverts 1234.56 to "$1,234.56"
    /// Coverts 12.3456 to "$12.3456"
    /// Coverts 0.123456 to "$0.123456"
    ///  ```
    
    func asCurrencyWith6Decimals()-> String{
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    
    func asNumberString()-> String {
        return String(format: "%.2f", self)
    }
    
    func asPercentString()-> String {
        return asNumberString() + "%"
    }
}
