//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Ale Mohamad on 17/12/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI
import CodeScanner
import UserNotifications

struct ProspectsView: View {
    @State private var isShowingScanner = false
    @State private var showingSortSheet = false
    @State private var isSortedByName = true
    
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    @EnvironmentObject var prospects: Prospects
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted }
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted }
        }
    }
    
    var sortedFilteredProspects: [Prospect] {
        if isSortedByName {
            // by name
            return filteredProspects.sorted(by: { $0.name < $1.name })
        } else {
            // by most recent
            return filteredProspects.reversed()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sortedFilteredProspects) { prospect in
                    HStack {
                        if self.filter == .none {
                            Image(systemName: prospect.isContacted ? "checkmark.circle" : "circle")
                        }
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                        }
                    }
                    .contextMenu {
                        Button(action: {
                            self.prospects.toggle(prospect)
                        }) {
                            Text(prospect.isContacted ? "Mark Uncontacted" : "Mark Contacted")
                            Image(systemName: prospect.isContacted ? "hand.thumbsdown" : "hand.thumbsup")
                        }
                        if !prospect.isContacted {
                            Button(action: {
                                self.addNotification(for: prospect)
                            }) {
                                Text("Remind Me")
                                Image(systemName: "calendar")
                            }
                        }
                    }
                }
            }
                .navigationBarTitle(title)
                .navigationBarItems(leading:
                    Button(action: {
                        self.showingSortSheet = true
                    }) {
                        Image(systemName: "arrow.up.arrow.down.square")
                        Text("Sort")
                    }
                , trailing:
                    Button(action: {
                        self.isShowingScanner = true
                    }) {
                        Image(systemName: "qrcode.viewfinder")
                        Text("Scan")
                    }
                )
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: self.handleScan)
                }
                .actionSheet(isPresented: $showingSortSheet) {
                    ActionSheet(title: Text("Sort prospects by:"), buttons: [
                        .default(Text("Name")) { self.isSortedByName = true },
                        .default(Text("Most Recent")) { self.isSortedByName = false },
                        .cancel()
                    ])
                }
        }
    }
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        self.isShowingScanner = false
        
        switch result {
        case .success(let code):
            let details = code.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]
            
            self.prospects.add(person)
        case .failure(let error):
            print("Scanning failed")
            print(error)
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            
            var dateComponents = DateComponents()
            dateComponents.hour = 9
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
