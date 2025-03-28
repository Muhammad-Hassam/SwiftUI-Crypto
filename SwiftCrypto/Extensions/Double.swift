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
        formatter.maximumFractionDigits = 2
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
    
    /// Convert a Double to a String with K, M, Bn, Tr abbreviations.
    /// ```
    /// Convert 12 to 12.00
    /// Convert 1234 to 1.23K
    /// Convert 123456 to 123.45K
    /// Convert 12345678 to 12.34M
    /// Convert 1234567890 to 1.23Bn
    /// Convert 123456789012 to 123.45Bn
    /// Convert 12345678901234 to 12.34Tr
    /// ```
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberString()

        default:
            return "\(sign)\(self)"
        }
    }
}
