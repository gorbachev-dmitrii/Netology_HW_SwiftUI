//
//  ProfileTabView.swift
//  Netology_HW_SwiftUI
//
//  Created by Dima Gorbachev on 16.10.2022.
//

import Foundation
import SwiftUI

struct ProfileTabView: View {
    @State private var userName = ""
    @State private var password = ""
    
    @Binding var tabSelection: Int
    @Binding var isViewDisabled : Bool
    
    var body: some View {
        VStack {
            Spacer()
            Image("logo").resizable().aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            Spacer()
            VStack {
                TextField("Email or phone", text : $userName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                SecureField("Password", text : $password)
                    .textFieldStyle(.roundedBorder)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    if !userName.isEmpty && !password.isEmpty {
                        closeKeyboard()
                        isViewDisabled = true
                        tabSelection = 1
                    }
                }) {
                    Text("Log in")
                        .foregroundColor(self.isViewDisabled ? .gray : .white)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.top, 8)
                .padding(.bottom, 8)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
            }
            Spacer()
        }
    }
    
    private func closeKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil
        )
    }
}

struct ProfileTabView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabView(tabSelection: .constant(1), isViewDisabled: .constant(false))
    }
}

