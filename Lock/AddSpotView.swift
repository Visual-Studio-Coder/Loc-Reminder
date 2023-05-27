//
//  AddSpotView.swift
//  Lock
//
//  Created by Vaibhav Satishkumar on 5/12/23.
//

import SwiftUI
import MapKit


struct AddSpotView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    
    @State private var notificationTitle = ""
    @State private var notificationBody = ""
    @State private var notifyOnBoth = false
    @State private var spotName = ""
    @State private var address = "Be sure to include the street name and number, zip code, city name, and name of country"
    @State private var notifyMeters = Float(100)
    @State private var region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: 40.83834587046632,
                        longitude: 14.254053016537693),
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.03,
                        longitudeDelta: 0.03)
                    )
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    HStack{
                        TextField("Name of Spot e.g. Home, School, Work", text: $spotName)
                        Spacer()
                        
                        }
                } footer: {
                    Text("This name will be what is listed in the Spots tab.")
                }
                
                Section {
                    TextEditor(text: $address)
                    Map(coordinateRegion: $region)
                        .scaledToFill()
                        .cornerRadius(14)
                        .padding(.vertical, 4.0)
    
                } header: {
                    Text("Enter your full address or location coordinates.")
                } footer: {
                    Text("The address is converted and saved to your device as coordinates. On the map, verify that the information you have entered is correct.")
                }
                
                Section {
                    Text("Notification Title:")
                    TextField("Important Question:", text: $notificationTitle)
                    Text("Notification Body:")
                    TextField("Have you locked your house?", text: $notificationBody)
                    
                    
                    
                    
                } header: {
                    Text("Customize the notification properties")
                    
                    
                    
                } footer: {
                    Text("Consider changing the default text to match your personal needs, such as remembering to turn off the stove or turning on the burglar alarm.")
                }
                
                
                
                Section{
                    Toggle("Receive notifications when you leave and arrive.", isOn: $notifyOnBoth)
                    Slider(value: $notifyMeters, in: 50...200, step: 2){}
                
                    minimumValueLabel: {
                            Text("50")
                            .fontWeight(.thin)
                    } maximumValueLabel: {
                            Text("200")
                            .fontWeight(.thin)
                    }
                    Group {
                    Text("Notifications will be delivered after") +
                    Text(" \(Int(notifyMeters)) ").foregroundColor(.blue) +
                    Text("meters.")
                    }

                    
                    
                } footer: {
                    Text("By default, you will only be notified when you leave a spot.")
                }
                
                
                Section {
                    Button("Save"){
                        
                    }
                    .buttonStyle(threeDimensionalButton())
                    
                        
                } footer: {
                    Text("If you ever need to, you can edit the properties of this spot or even just delete it.")
                    
                    
                }.listRowBackground(Color.clear)
                    .frame(height: 60)
                

                
                
                
                
                
            }
            
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Add a Spot")
            
            
        }
        
    }
}

struct AddSpotView_Previews: PreviewProvider {
    static var previews: some View {
        AddSpotView()
    }
}
