//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by Johny Wills on 08/02/2022.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPin = false

    var body: some View {
        NavigationView {
            List {
                profile
                menu
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }

    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.4))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    BlobView()
                        .offset(x: -400, y: -200)
                        .scaleEffect(0.3)
                )
                .background(
                    BlobView()
                        .offset(x: 300, y: -50)
                        .scaleEffect(0.6)
                )
                .background(
                    BlobView()
                        .offset(x: -300, y: 250)
                        .scaleEffect(0.6)
                )
            Text("Johny Wills")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location").imageScale(.small)
                Text("Japan").foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }

    var menu: some View {
        Section {
            NavigationLink(destination: ContentView()) {
                Label("Settings", systemImage: "gear")
            }
            NavigationLink { Text("Billing View") } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink { ContentView() } label: {
                Label("Help", systemImage: "questionmark")
            }
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.black)
        .listRowSeparator(.hidden)
    }

    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://apple.com")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(action: { isDeleted = true }) {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    pinButton
                }
            }
        }
        .accentColor(.primary)
    }

    var pinButton: some View {
        Button(action: { isPin.toggle() }) {
            isPin ? Label("Unpin", systemImage: "pin.slash") : Label("Pin", systemImage: "pin")
        }
        .tint(isPin ? .gray : .yellow)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .previewDevice("iPhone 13")
    }
}
