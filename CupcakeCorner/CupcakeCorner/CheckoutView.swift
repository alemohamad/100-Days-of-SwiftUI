//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Ale Mohamad on 12/11/2019.
//  Copyright © 2019 Ale Mohamad. All rights reserved.
//

import SwiftUI
import Network

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @State private var hasConnection = true
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Image("cupcakes")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width)
                    .accessibility(hidden: true)
                
                Text("Your order is $\(self.order.cost, specifier: "%.2f")")
                    .font(.title)
                
                Button("Place order") {
                    self.placeOrder()
                }
                .padding()
            }
        }
        .navigationBarTitle(Text("Check out"), displayMode: .inline)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
        .onAppear {
            self.listen2Connection()
        }
    }
    
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        // Challenge 2
        if hasConnection {
            sendData(url: URL(string: "https://reqres.in/api/cupcakes")!, encoded: encoded)
        } else {
            alertTitle = "Connection error"
            alertMessage = "There was an Internet connection issue."
            showingAlert = true
        }
    }
    
    func sendData(url: URL, encoded: Data) {
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unkown")")
                return
            }
            
            if let decoderOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.alertTitle = "Thank you!"
                self.alertMessage = "Your order for \(decoderOrder.quantity)x \(Order.types[decoderOrder.type].lowercased()) cupcakes is on its way!"
                self.showingAlert = true
            } else {
                print("Invalid code from server")
            }
        }.resume()
    }
    
    func listen2Connection() {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.hasConnection = true
            } else {
                self.hasConnection = false
            }
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView(order: Order())
        }
    }
}
