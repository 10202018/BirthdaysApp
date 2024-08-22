//
//  ContentView.swift
//  Birthdays
//
//  Created by Jah Morris-Jones on 8/21/24.
//

import SwiftUI

struct ContentView: View {
  @State private var newName = ""
  @State private var newDate = Date.now
  
  @State private var friends: [Friend] = [
    Friend(name: "Elton Lin", birthday: .now),
    Friend(name: "Jenny Court", birthday: Date(timeIntervalSince1970: 0))
  ]
  
  var body: some View {
    NavigationStack {
      List(friends, id: \.name) { friend in
        HStack {
          Text(friend.name)
          Spacer()
          Text(friend.birthday, format: .dateTime.month(.wide).day().year())
        }
      }
      .navigationTitle("Birthdays")
      .safeAreaInset(edge: .bottom) {
        VStack(alignment: .center) {
          Text("New Birthday")
            .font(.headline)
          
          DatePicker(selection: $newDate, in: Date.distantPast...Date.now) {
            TextField("Name", text: $newName)
              .textFieldStyle(.roundedBorder)
          }
          
          Button("Save") {
            let newFriend = Friend(name: newName, birthday: newDate)
            friends.append(newFriend)
            
            newName = ""
            newDate = .now
          }
          .bold()
        }
        .padding()
        .background(.bar)
      }
    }
  }
}


#Preview {
  ContentView()
}
