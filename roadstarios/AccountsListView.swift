/*
 Copyright (c) 2019-present, salesforce.com, inc. All rights reserved.a
 
 Redistribution and use of this software in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice, t                                                     his list of conditions
 and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of
 conditions and the following disclaimer in the documentation and/or other materials provided
 with the distribution.
 * Neither the name of salesforce.com, inc. nor the names of its contributors may be used to
 endorse or promote products derived from this software without specific prior written
 permission of salesforce.com, inc.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
 WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


import Foundation
import SwiftUI
import Combine
import SalesforceSDKCore

struct AccountsListView: View {
    @ObservedObject var viewModel = AccountsListModel()
    @State private var selectedView: Int? = 1
    var sizeIcons:CGFloat = 24
    
    var body: some View {
        NavigationView {
            VStack(spacing:20) {
                
                HStack(spacing:20) {
                    Image("camera")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: sizeIcons, height: sizeIcons)
                    Text("Take Picture")
                        .foregroundColor(.black)
                    Spacer()
                }.padding(.horizontal,20)
                
                HStack(spacing:20) {
                    Image("unlock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: sizeIcons, height: sizeIcons)
                    Text("Change Password")
                    Spacer()
                }.padding(.horizontal,20)
                
                NavigationLink(
                    destination: InspectionModuleView(),
                    tag: 1,
                    selection: $selectedView,
                    label: {
                        HStack(spacing:20) {
                            Image("settings_overscan")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: sizeIcons, height: sizeIcons)
                            Text("Inspection Module").foregroundColor(.black)
                            Spacer()
                        }.padding(.horizontal,20)
                    }
                )
                
                NavigationLink {
                    ChatView()
                } label: {
                    HStack(spacing:20) {
                        Image("chat")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: sizeIcons, height: sizeIcons)
                        Text("Chat").foregroundColor(.black)
                        Spacer()
                    }.padding(.horizontal,20)
                }
                
                HStack(spacing:20) {
                    Image("scanner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: sizeIcons, height: sizeIcons)
                    Text("Paper Scan")
                    Spacer()
                }.padding(.horizontal,20)
                
                NavigationLink {
                    ChatView()
                } label: {
                    HStack(spacing:20) {
                        Image("settings")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: sizeIcons, height: sizeIcons)
                        Text("Settings").foregroundColor(.black)
                        Spacer()
                    }.padding(.horizontal,20)
                }
                
                HStack(spacing:20) {
                    Image("rules")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: sizeIcons, height: sizeIcons)
                    Text("HOS Basic Rules")
                    Spacer()
                }.padding(.horizontal,20)
                
                HStack(spacing:20) {
                    Image("logout")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: sizeIcons, height: sizeIcons)
                    Text("Log Out")
                    Spacer()
                }.padding(.horizontal,20)
                
                Spacer()
                
            }.padding(.top,20)
            .navigationBarTitle(Text("RoadStar"), displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                
            }) {
                Image("mode_night")
            }
            )
        }
        .listStyle(SidebarListStyle())
        .onAppear {
//            self.viewModel.fetchAccounts()
            self.selectedView = 1
        }
    }
}

struct AccountsList_Previews: PreviewProvider {
    static var previews: some View {
        AccountsListView()
    }
}

