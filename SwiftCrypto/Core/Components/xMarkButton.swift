//
//  xMarkButton.swift
//  SwiftCrypto
//
//  Created by Hassam Shaikh on 26/03/2025.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action:{
           presentationMode.wrappedValue.dismiss()
       },label: {
           Image(systemName: "xmark")
               .font(.headline)
       })
    }
}

#Preview {
    XMarkButton()
}
