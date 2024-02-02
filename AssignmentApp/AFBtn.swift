//
//  AFBtn.swift
//  AssignmentApp
//
//  Created by Shreya Wanjari on 02/02/24.
//

import SwiftUI

struct AFBtn: View {
    
    var title  : String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 120,height: 50)
            .background(.pink)
            .foregroundColor(.white)
            .cornerRadius(15)

    }
}

#Preview {
    AFBtn(title : "demo btn")
}
